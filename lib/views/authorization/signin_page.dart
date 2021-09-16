import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding( padding: const EdgeInsets.only(left: 20, top: 100),
          child: Text('Добро пожаловать', style: TextStyle(color: AppColors.green,fontSize: 24, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Войдите в систему, чтобы продолжить', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            child: TextFormField(
              onTap: (){
                focusNode.requestFocus();
                passwordFocusNode.unfocus();
                setState((){});
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
                labelStyle: TextStyle(color: focusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Номер телефона",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey, width:1)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gold, width:1)
                )
              ),
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
              onTap: (){
                focusNode.unfocus();
                passwordFocusNode.requestFocus();
                setState((){});
              },
              focusNode: passwordFocusNode,
              controller: passwordController,
              cursorColor: Colors.black,
              maxLength: 12,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: passwordFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Пароль",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey, width:1)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gold, width:1)
                )
              ),
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
          child: 
            GestureDetector(
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
            )
        ),
        Center(child: getButton('ВОЙТИ')),
        Spacer(),
        Center(
          child: Padding( padding: const EdgeInsets.symmetric(vertical: 40),
            child: getBitText('У вас нет учетной записи?', 'Зарегистрируйтесь'),
          )
        ),
      ])
    ));
  }
}