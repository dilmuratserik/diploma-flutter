import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:mobile/views/authorization/verification_page.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({Key? key}) : super(key: key);

  @override
  _SetPasswordPageState createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
  FocusNode newPasswordFocusNode = FocusNode();
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
          child: Text('Установите пароль', style: TextStyle(color: AppColors.green,fontSize: 24, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Придумайте пароль и заполните пустые поля', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            child: TextFormField(
              onTap: (){
                newPasswordFocusNode.requestFocus();
                passwordFocusNode.unfocus();
                setState((){});
              },
              focusNode: newPasswordFocusNode,
              controller: newPasswordController,
              cursorColor: Colors.black,
              maxLength: 12,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: newPasswordFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Новый пароль",
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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            child: TextFormField(
              onTap: (){
                newPasswordFocusNode.unfocus();
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
                labelText: "Повторите пароль",
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
        Center(child: getButton('УСТАНОВИТЬ ПАРОЛЬ' )),
      ])
    ));
  }
}
