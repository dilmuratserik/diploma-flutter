import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/services/auth_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:mobile/views/verification/verification_page.dart';
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
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 100),
            child: Text('Регистрация',
                style: TextStyle(
                    color: AppColors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                'Введите номер телефона, чтобы отправить код верификации',
                style: TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              child: TextFormField(
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
                        color:
                            focusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "Номер телефона",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
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
              onPressed: () {
                registration();
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
            child: getBitText('У вас есть учетная запись?', 'Войти'),
          )),
        ])));
  }

  void registration() async {
    if (phoneController.text != '') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await AuthProvider().registration(phoneController.text);
      print(response);
      if (response != 'Error') {
        print('OK!');
        prefs.setString('phone', phoneController.text);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerificationPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Something went wrong.", style: TextStyle(fontSize: 20)),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Заполните поле.", style: TextStyle(fontSize: 20)),
      ));
    }
  }
}
