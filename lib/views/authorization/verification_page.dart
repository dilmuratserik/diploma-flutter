import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/services/auth_api_provider.dart';
import 'package:mobile/views/authorization/registrationSecond_page.dart';
import 'package:mobile/views/sales_rep/home_page/sales_home_page.dart';
import 'package:mobile/views/sales_rep/sales_main_menu.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  // StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = new TextEditingController();
  late Timer _timer;
  String _time = "00";

  @override
  void initState() {
    startTimer();
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
            title: Text('СМС код',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            brightness: Brightness.light,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            bottomOpacity: 1,
            iconTheme: IconThemeData(color: Colors.black)),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text('Верификация',
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 24,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text('Код выслан на ' + widget.phone,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      child: getInputFiled(context),
                    ),
                    Center(
                        child: _time != "00"
                            ? Text("Получить новый код можно через 00:${_time}")
                            : GestureDetector(
                                onTap: () {
                                  startTimer();
                                },
                                child: Text(
                                  "Получить новый код",
                                  style: TextStyle(
                                      color: AppColors.gold,
                                      fontSize: 18,
                                      fontFamily: "Roboto"),
                                ),
                              )),
                    Center(child: _getButton()),
                  ],
                ),
                Spacer(),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: getRichText(),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // textEditingController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    int _start = 60;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            _start < 10 ? _time = "0${_start}" : _time = "$_start";
          });
        }
      },
    );
  }

  Widget _getButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          sendVerificationCode();
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
        child: Text("Отправить код"),
      ),
    );
  }

  Widget getInputFiled(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      cursorColor: AppColors.green,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 65,
          fieldWidth: 55,
          inactiveColor: AppColors.editTextBorderColor,
          inactiveFillColor: Colors.white,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: AppColors.editTextBorderColor,
          activeColor: AppColors.editTextBorderColor,
          borderWidth: 1),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      controller: textEditingController,
      onCompleted: (v) {
        sendVerificationCode();
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
    );
  }

  TextStyle defaultStyle =
      TextStyle(color: HexColor.fromHex("#505050"), fontSize: 14.0);
  TextStyle linkStyle = TextStyle(color: AppColors.gold);

  Widget getRichText() {
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: 'У вас есть учетная запись?'),
          TextSpan(
              text: ' Войти',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                }),
        ],
      ),
    );
  }

  void sendVerificationCode() async {
    if (textEditingController.text.length == 4) {
      var response =
          await AuthProvider().sendVerificationCode(textEditingController.text);
      if (response['status'] == 'ok') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", response['key']);
        prefs.setInt("user_id", response['uid']);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationSecondPage()));
        AppConstants.isSignIn = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Неправильный код.", style: TextStyle(fontSize: 20)),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Заполните поле.", style: TextStyle(fontSize: 20)),
      ));
    }
  }
}
