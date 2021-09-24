import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';

class RegistrationSecondPage extends StatefulWidget {
  const RegistrationSecondPage({Key? key}) : super(key: key);

  @override
  _RegistrationSecondPageState createState() => _RegistrationSecondPageState();
}

class _RegistrationSecondPageState extends State<RegistrationSecondPage> {
  
  TextEditingController roleController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
  FocusNode roleFocusNode = FocusNode();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  

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
          child: Text('Регистрация', style: TextStyle(color: AppColors.green,fontSize: 24, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Заполните свои данные', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Container(
            child: TextFormField(
              onTap: (){
                roleFocusNode.requestFocus();
                fullNameFocusNode.unfocus();
                countryFocusNode.unfocus();
                cityFocusNode.unfocus();
                setState((){});
              },
              focusNode: roleFocusNode,
              controller: roleController,
              cursorColor: Colors.black,
              maxLength: 30,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: roleFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Роль",
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
                  return 'Заполните это поле';
                }
                return null;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            child: TextFormField(
              onTap: (){
                roleFocusNode.unfocus();
                fullNameFocusNode.requestFocus();
                countryFocusNode.unfocus();
                cityFocusNode.unfocus();
                setState((){});
              },
              focusNode: fullNameFocusNode,
              controller: fullNameController,
              cursorColor: Colors.black,
              maxLength: 30,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: fullNameFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "ФИО",
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
                  return 'Заполните это поле';
                }
                return null;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            child: TextFormField(
              onTap: (){
                roleFocusNode.unfocus();
                fullNameFocusNode.unfocus();
                countryFocusNode.requestFocus();
                cityFocusNode.unfocus();
                setState((){});
              },
              focusNode: countryFocusNode,
              controller: countryController,
              cursorColor: Colors.black,
              maxLength: 30,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: countryFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Страна",
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
                  return 'Заполните это поле';
                }
                return null;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            child: TextFormField(
              onTap: (){
                roleFocusNode.unfocus();
                fullNameFocusNode.unfocus();
                countryFocusNode.unfocus();
                cityFocusNode.requestFocus();
                setState((){});
              },
              focusNode: cityFocusNode,
              controller: cityController,
              cursorColor: Colors.black,
              maxLength: 30,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: cityFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Город",
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
                  return 'Заполните это поле';
                }
                return null;
              },
            ),
          ),
        ),
        Spacer(),
        Center(child: getButton('ПРОДОЛЖИТЬ РЕГИСТРАЦИЮ')),
        Center(
          child: Padding( padding: const EdgeInsets.only(bottom: 40, top: 20),
            child: getBitText('У вас есть учетная запись?', 'Войти'),
          )
        ),
      ])
    ));
  }
}
