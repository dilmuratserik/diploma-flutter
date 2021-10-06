import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

class SalesCreateOrderPage extends StatefulWidget {
  const SalesCreateOrderPage({Key? key}) : super(key: key);

  @override
  _SalesCreateOrderPageState createState() => _SalesCreateOrderPageState();
}

class _SalesCreateOrderPageState extends State<SalesCreateOrderPage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Чтобы создать новый заказ, пожалуйста заполните поля",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                child: TextFormField(
                  controller: thirdController,
                  cursorColor: Colors.black,
                  enableSuggestions: false,
                  autocorrect: false,
                  maxLength: 30,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: thirdFocusNode.hasFocus
                              ? AppColors.gold
                              : Colors.grey),
                      focusColor: Colors.grey,
                      fillColor: Colors.grey,
                      counterText: "",
                      labelText: "Номер заказа",
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

          ],
        ),
      );
  }
}
