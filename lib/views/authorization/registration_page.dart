import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/appBar.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/services/auth_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:mobile/views/authorization/verification_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
  FocusNode focusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text('Регистрация',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                automaticallyImplyLeading: true,
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                bottomOpacity: 1,
                iconTheme: IconThemeData(color: Colors.black)),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text('Регистрация',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                    'Введите номер телефона, чтобы отправить код верификации',
                    style: TextStyle(fontSize: 14)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  child: TextFormField(
                    onTap: () {
                      focusNode.requestFocus();
                      setState(() {});
                    },
                    focusNode: focusNode,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    cursorColor: Colors.black,
                    maxLength: 12,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      _mobileFormatter,
                    ],
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: focusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Номер телефона",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gold, width: 1))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Номер телефона';
                      } else if (!value.contains('+')) {
                        return 'Введите корректный номер телефона';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.none) {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Внимание",
                        desc: "Соединение с интернетом отсутствует.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.red,
                          ),
                        ],
                      ).show();
                    } else {
                      registration();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          30), // double.infinity is the width and 30 is the height
                      primary: AppColors.green,
                      padding: EdgeInsets.symmetric(vertical: 17),
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto")),
                  child: Text('ОТПРАВИТЬ КОД'),
                ),
              )),
              Spacer(),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: RichText(
                        text: TextSpan(
                          style: defaultStyle,
                          children: <TextSpan>[
                            TextSpan(text: 'У вас есть учетная запись?'),
                            TextSpan(
                                text: ' ' + 'Войти',
                                style: linkStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  }),
                          ],
                        ),
                      ))),
            ])));
  }

  void registration() async {
    if (phoneController.text.length == 12) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response =
          await AuthProvider().registration(phoneController.text.substring(1));
      if (response != 'Error') {
        prefs.setString('phone', phoneController.text.substring(1));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationPage(
                      phone: phoneController.text,
                    )));
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Извините",
          desc: "Сервер не отвечает! Попробуйте позже...",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.red,
            ),
          ],
        ).show();
      }
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Внимание",
        desc: "Заполните поле.",
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          ),
        ],
      ).show();
    }
  }
}
