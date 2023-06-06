import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/services/profile_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
  import 'package:mobile/views/utills/utill.dart' as utill;
import 'package:shared_preferences/shared_preferences.dart';

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

  final _formKey = GlobalKey<FormState>();


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
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body: Form(
            key: _formKey,
            child: Column(children: [
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
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.presentationGray,
                                  )
                                : Icon(Icons.visibility,
                                    color: AppColors.presentationGray)),
                        labelStyle: TextStyle(
                            color: firstFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Старый пароль",
                        focusedErrorBorder: utill.errorBorder,
                        errorBorder: utill.errorBorder,
                        enabledBorder: utill.enabledBorder,
                        focusedBorder: utill.enabledBorder
                    ),
                    validator: (value) {
                      return utill.validatePassword(value!);
                      // if (value!.isEmpty) {
                      //   return 'Заполните это поле';
                      // }
                      // else if (value.length < 8) {
                      //   return 'Минимально необходимое количество символов 8';
                      // }
                      // return null;
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
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.presentationGray,
                                  )
                                : Icon(Icons.visibility,
                                    color: AppColors.presentationGray)),
                        labelStyle: TextStyle(
                            color: secondFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Новый пароль",
                        focusedErrorBorder: utill.errorBorder,
                        errorBorder: utill.errorBorder,
                        enabledBorder: utill.enabledBorder,
                        focusedBorder: utill.enabledBorder
                       ),
                    validator: (value) {
                      // if (  value!.isEmpty) {
                      //   return 'Заполните это поле';
                      // }
                      // else if (value.length < 8) {
                      //   return 'Минимально необходимое количество символов 8';
                      // }
                      // return null;
                      return utill.validatePassword(value!);
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
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.presentationGray,
                                  )
                                : Icon(Icons.visibility,
                                    color: AppColors.presentationGray)),
                        labelStyle: TextStyle(
                            color: thirdFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Повторите новый пароль",
                        focusedErrorBorder: utill.errorBorder,
                        errorBorder: utill.errorBorder,
                        enabledBorder: utill.enabledBorder,
                        focusedBorder: utill.enabledBorder
                      ),
                    validator: (value) {
                      // if (value!.isEmpty ) {
                      //   return 'Заполните это поле';
                      // }
                      // else if (value.length < 8) {
                      //   return 'Минимально необходимое количество символов 8';
                      // }
                       if (value != secondController.text) {
                        return 'Пароли не совпадают';
                      }
                       else { return utill.validatePassword(value!);
                       }
                      // return null;
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
          ),
        ));
  }

  void changePassword(String oldPassword, String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getInt("user_id");
    print("uid " + uid.toString());

    String response =
        await ProfileProvider().changePassword(oldPassword, newPassword);

    if (response == "Success") {
      final snackBar = SnackBar(content: Text('Данные изменены'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else {
      final snackBar = SnackBar(content: Text('У вас неправильный пароль'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget getButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            changePassword(firstController.text, secondController.text);
          }
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 30),
            // double.infinity is the width and 30 is the height
            primary: AppColors.green,
            padding: EdgeInsets.symmetric(vertical: 17),
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto")),
        child: Text(text),
      ),
    );
  }
}
