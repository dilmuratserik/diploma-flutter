import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

  bool firstObsure = true;
  bool secondObsure = true;
  bool thirdObsure = true;

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
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Изменить пароль',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              brightness: Brightness.light,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                child: TextFormField(
                  onTap: () {
                    firstFocusNode.requestFocus();
                    secondFocusNode.unfocus();
                    thirdFocusNode.unfocus();
                    setState(() {});
                  },
                  focusNode: firstFocusNode,
                  controller: firstController,
                  cursorColor: Colors.black,
                  obscureText: firstObsure,
                  enableSuggestions: false,
                  autocorrect: false,
                  maxLength: 30,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              firstObsure = !firstObsure;
                            });
                          },
                          child: (firstObsure)
                              ? Icon(Icons.visibility_off, color: AppColors.presentationGray,)
                              : Icon(Icons.visibility, color: AppColors.presentationGray)),
                      labelStyle: TextStyle(
                          color: firstFocusNode.hasFocus
                              ? AppColors.gold
                              : Colors.grey),
                      focusColor: Colors.grey,
                      fillColor: Colors.grey,
                      counterText: "",
                      labelText: "Старый пароль",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.gold, width: 1))),
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                child: TextFormField(
                  onTap: () {
                    firstFocusNode.unfocus();
                    secondFocusNode.requestFocus();
                    thirdFocusNode.unfocus();
                    setState(() {});
                  },
                  obscureText: secondObsure,
                  enableSuggestions: false,
                  autocorrect: false,
                  focusNode: secondFocusNode,
                  controller: secondController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              secondObsure = !secondObsure;
                            });
                          },
                          child: (secondObsure)
                              ? Icon(Icons.visibility_off, color: AppColors.presentationGray,)
                              : Icon(Icons.visibility, color: AppColors.presentationGray)),
                      labelStyle: TextStyle(
                          color: secondFocusNode.hasFocus
                              ? AppColors.gold
                              : Colors.grey),
                      focusColor: Colors.grey,
                      fillColor: Colors.grey,
                      counterText: "",
                      labelText: "Новый пароль",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.gold, width: 1))),
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
                  onTap: () {
                    firstFocusNode.unfocus();
                    secondFocusNode.unfocus();
                    thirdFocusNode.requestFocus();
                    setState(() {});
                  },
                  focusNode: thirdFocusNode,
                  controller: thirdController,
                  cursorColor: Colors.black,
                  obscureText: thirdObsure,
                  enableSuggestions: false,
                  autocorrect: false,
                  maxLength: 30,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              thirdObsure = !thirdObsure;
                            });
                          },
                          child: (thirdObsure)
                              ? Icon(Icons.visibility_off, color: AppColors.presentationGray,)
                              : Icon(Icons.visibility, color: AppColors.presentationGray)),
                      labelStyle: TextStyle(
                          color: thirdFocusNode.hasFocus
                              ? AppColors.gold
                              : Colors.grey),
                      focusColor: Colors.grey,
                      fillColor: Colors.grey,
                      counterText: "",
                      labelText: "Повторите новый пароль",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.gold, width: 1))),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              child: Center(child: getButton('СОХРАНИТЬ')),
            ),
          ]),
        ));
  }
}
