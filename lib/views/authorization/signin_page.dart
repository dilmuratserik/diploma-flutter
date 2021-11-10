import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/services/auth_api_provider.dart';
import 'package:mobile/views/authorization/registration_page.dart';
import 'package:mobile/views/sales_rep/home_page/sales_home_page.dart';
import 'package:mobile/views/sales_rep/sales_main_menu.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:mobile/views/authorization/verification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main_menu.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 80),
                child: Text('Добро пожаловать',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Войдите в систему, чтобы продолжить',
                    style: TextStyle(fontSize: 14)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  child: TextFormField(
                    onTap: () {
                      focusNode.requestFocus();
                      passwordFocusNode.unfocus();
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  child: TextFormField(
                    onTap: () {
                      focusNode.unfocus();
                      passwordFocusNode.requestFocus();
                      setState(() {});
                    },
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    obscureText: true,
                    cursorColor: Colors.black,
                    maxLength: 12,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: passwordFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Пароль",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gold, width: 1))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Пароль';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  print('Click');
                },
                child: Text(
                  "Забыли пароль?",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontFamily: "Roboto",
                      decoration: TextDecoration.underline),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.none) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Соединение с интернетом отсутствует.",
                            style: TextStyle(fontSize: 16)),
                      ));
                    } else {
                      login();
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
                  child: Text('ВОЙТИ'),
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
                            TextSpan(text: 'У вас нет учетной записи?'),
                            TextSpan(
                                text: ' ' + 'Зарегистрируйтесь',
                                style: linkStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationPage()));
                                  }),
                          ],
                        ),
                      ))),
            ]),
          ),
        )));
  }

  void login() async {
    if (phoneController.text.length == 12 &&
        passwordController.text.length > 5) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await AuthProvider()
          .login(phoneController.text.substring(1), passwordController.text);
      if (response['status'] == 'ok') {
        prefs.setString("token", response['key']);
        prefs.setInt("user_id", response['uid']);
        prefs.setString("role", response['role'].toString());

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainMenuPage()),
            (Route<dynamic> route) => false);
        AppConstants.isSignIn = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Неправильный логин или пароль.",
              style: TextStyle(fontSize: 16)),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text("Заполните поля корректно.", style: TextStyle(fontSize: 16)),
      ));
    }
  }
}
