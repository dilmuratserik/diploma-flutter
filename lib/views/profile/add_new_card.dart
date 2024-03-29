import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';

class AddNewCardPage extends StatefulWidget {
  // AddNewCardPage(this.product);
  // final Product product;

  @override
  _AddNewCardPageState createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

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
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Добавление карты', style: TextStyle(color: Colors.black, fontSize: 18)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                child: TextFormField(
                  onTap: (){
                    firstFocusNode.requestFocus();
                    secondFocusNode.unfocus();
                    thirdFocusNode.unfocus();
                    fourthFocusNode.unfocus();
                    setState((){});
                  },
                  focusNode: firstFocusNode,
                  controller: firstController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: firstFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "Номер карты",
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                child: TextFormField(
                  onTap: (){
                    firstFocusNode.unfocus();
                    secondFocusNode.requestFocus();
                    thirdFocusNode.unfocus();
                    fourthFocusNode.unfocus();
                    setState((){});
                  },
                  focusNode: secondFocusNode,
                  controller: secondController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: secondFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "ММ/ГГ",
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
                    firstFocusNode.unfocus();
                    secondFocusNode.unfocus();
                    thirdFocusNode.requestFocus();
                    fourthFocusNode.unfocus();
                    setState((){});
                  },
                  focusNode: thirdFocusNode,
                  controller: thirdController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: thirdFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "CVC/CVV",
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
                    firstFocusNode.unfocus();
                    secondFocusNode.unfocus();
                    thirdFocusNode.unfocus();
                    fourthFocusNode.requestFocus();
                    setState((){});
                  },
                  focusNode: fourthFocusNode,
                  controller: fourthController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: fourthFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "Имя на карте",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:60),
              child: Center(child: getButton('СОХРАНИТЬ')),
            ),
          ]),
        )
    );
  }
}