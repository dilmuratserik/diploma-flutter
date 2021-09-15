import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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
  final _mobileFormatter = NumberTextInputFormatter();

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
              keyboardType: TextInputType.phone,
              controller: phoneController,
              maxLength: 12,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                _mobileFormatter,
              ],
              decoration: InputDecoration(
                focusColor: Colors.grey,
                fillColor: Colors.grey,
                counterText: "",
                labelText: "Номер телефона",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width:2)
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
      ])
    ));
  }
}
