import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/services/auth_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile/views/utills/utill.dart' as utill;
import '../../main_menu.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({
    Key? key,
    required this.role,
    required this.name,
    required this.iin,
    required this.country,
    required this.city,
  }) : super(key: key);
  final String role;
  final String name;
  final String iin;
  final String country;
  final String city;

  @override
  _SetPasswordPageState createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();


  bool firstObsure = true;
  bool secondObsure = true;

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
                title: Text('Пароль',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                automaticallyImplyLeading: true,
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                bottomOpacity: 1,
                iconTheme: IconThemeData(color: Colors.black)),
            body:
                Form(
                  key: _formKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text('Установите пароль',
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Придумайте пароль и заполните пустые поля',
                      style: TextStyle(fontSize: 14)),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Container(
                    child: TextFormField(
                      onTap: () {
                        newPasswordFocusNode.requestFocus();
                        passwordFocusNode.unfocus();
                        setState(() {});
                      },
                      focusNode: newPasswordFocusNode,
                      controller: newPasswordController,
                      cursorColor: Colors.black,
                      obscureText: secondObsure,
                      maxLength: 12,
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
                              color: newPasswordFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "Новый пароль",
                          errorBorder: utill.errorBorder,
                          focusedErrorBorder: utill.errorBorder,
                          enabledBorder: utill.enabledBorder,
                          focusedBorder: utill.focusedBorder
                      ),
                      validator: (value) {
                        return utill.validatePassword(value!);
                      }
                        // if (value!.isEmpty) {
                        //   return 'Пароль';
                        // }
                        // return null;
                      // },
                    ),
                  ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    child: TextFormField(
                      onTap: () { 
                        newPasswordFocusNode.unfocus();
                        passwordFocusNode.requestFocus();
                        setState(() {});
                      },
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      cursorColor: Colors.black,
                      obscureText: firstObsure,
                      maxLength: 12,
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
                              color: passwordFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "Повторите пароль",
                          errorBorder: utill.errorBorder,
                          focusedErrorBorder: utill.errorBorder,
                          enabledBorder: utill.enabledBorder,
                          focusedBorder: utill.focusedBorder
                          // enabledBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //     borderSide:
                          //         BorderSide(color: Colors.grey, width: 1)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: AppColors.gold, width: 1))
                      ),
                      validator: (value) {
                        return utill.validatePassword(value!);
                        // if (value!.isEmpty) {
                        //   return 'Пароль';
                        // }
                        // return null;
                      },
                    ),
                  ),
              ),
              Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
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
                          sendData();
                        }
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
                    child: Text('УСТАНОВИТЬ ПАРОЛЬ'),
                  ),
              )),
            ]),
                )));
  }

  void sendData() async {
    if (passwordController.text == newPasswordController.text) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await AuthProvider().setProfileData(
          widget.role,
          widget.name,
          widget.iin,
          widget.country,
          widget.city,
          passwordController.text);
      if (response['status'] == 'ok') {
        prefs.setString('role', widget.role);
        Alert(
          context: context,
          type: AlertType.success,
          title: "Поздравляем",
          desc: "Регистрация прошла успешно.",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuPage()),
                    (Route<dynamic> route) => false);
                AppConstants.isSignIn = true;
              },
              color: AppColors.green,
            ),
          ],
        ).show();
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
        desc: "Пароли не совпадают.",
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
