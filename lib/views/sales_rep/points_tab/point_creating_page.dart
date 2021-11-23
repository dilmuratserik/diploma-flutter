import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/services/points_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PointCreatingPage extends StatefulWidget {
  const PointCreatingPage({Key? key}) : super(key: key);

  @override
  _PointCreatingPageState createState() => _PointCreatingPageState();
}

class _PointCreatingPageState extends State<PointCreatingPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  FocusNode focusNode7 = FocusNode();

  final _mobileFormatter = NumberTextInputFormatter();

  Object? _value;
  List<String> items = ['Пивнушка', 'Магазин', 'Супермаркет'];

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
          title: Text('Точки',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.requestFocus();
                                  focusNode2.unfocus();
                                  focusNode3.unfocus();
                                  focusNode4.unfocus();
                                  focusNode5.unfocus();
                                  focusNode6.unfocus();
                                  focusNode7.unfocus();
                                },
                                focusNode: focusNode1,
                                controller: controller1,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode1.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "Код организации",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.unfocus();
                                  focusNode2.requestFocus();
                                  focusNode3.unfocus();
                                  focusNode4.unfocus();
                                  focusNode5.unfocus();
                                  focusNode6.unfocus();
                                  focusNode7.unfocus();
                                },
                                focusNode: focusNode2,
                                controller: controller2,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode2.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "Название организации",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.unfocus();
                                  focusNode2.unfocus();
                                  focusNode3.requestFocus();
                                  focusNode4.unfocus();
                                  focusNode5.unfocus();
                                  focusNode6.unfocus();
                                  focusNode7.unfocus();
                                },
                                focusNode: focusNode3,
                                controller: controller3,
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.black,
                                maxLength: 12,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]")),
                                  _mobileFormatter,
                                ],
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode3.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "Номер телефона",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.unfocus();
                                  focusNode2.unfocus();
                                  focusNode3.unfocus();
                                  focusNode4.requestFocus();
                                  focusNode5.unfocus();
                                  focusNode6.unfocus();
                                  focusNode7.unfocus();
                                },
                                focusNode: focusNode4,
                                controller: controller4,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode4.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.unfocus();
                                  focusNode2.unfocus();
                                  focusNode3.unfocus();
                                  focusNode4.unfocus();
                                  focusNode5.requestFocus();
                                  focusNode6.unfocus();
                                  focusNode7.unfocus();
                                },
                                focusNode: focusNode5,
                                controller: controller5,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode5.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "ФИО",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.unfocus();
                                  focusNode2.unfocus();
                                  focusNode3.unfocus();
                                  focusNode4.unfocus();
                                  focusNode5.unfocus();
                                  focusNode6.requestFocus();
                                  focusNode7.unfocus();
                                },
                                focusNode: focusNode6,
                                controller: controller6,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode6.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "БИН/ИИН организации",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            height: 60,
                            child: InputDecorator(
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent, fontSize: 16),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                isEmpty: false,
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: _value,
                                        items: [
                                          for (int i = 0; i < items.length; i++)
                                            DropdownMenuItem(
                                              child: Text(items[i]),
                                              value: i + 1,
                                            ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        },
                                        hint: Text("Категория")))),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: TextFormField(
                                onTap: () {
                                  focusNode1.unfocus();
                                  focusNode2.unfocus();
                                  focusNode3.unfocus();
                                  focusNode4.unfocus();
                                  focusNode5.unfocus();
                                  focusNode6.unfocus();
                                  focusNode7.requestFocus();
                                },
                                focusNode: focusNode7,
                                controller: controller7,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: focusNode7.hasFocus
                                            ? AppColors.gold
                                            : Colors.grey),
                                    focusColor: Colors.grey,
                                    fillColor: Colors.grey,
                                    counterText: "",
                                    labelText: "Комментарий",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.gold, width: 1))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Заполните это поле';
                                  }
                                  return null;
                                },
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller1.text != '' &&
                                    controller2.text != '' &&
                                    controller3.text != '' &&
                                    controller4.text != '' &&
                                    controller5.text != '' &&
                                    controller6.text != '' &&
                                    controller7.text != '' &&
                                    _value != null) {
                                  createPoint();
                                } else {
                                  Alert(
                                    context: context,
                                    type: AlertType.warning,
                                    title: "Извините",
                                    desc: "Заполните все поля!",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Ок",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: AppColors.lightRed,
                                      ),
                                    ],
                                  ).show();
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
                              child: Text('ДОБАВИТЬ ТОЧКУ'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createPoint() async {
    var response = await PointsProvider().createPoint(
        controller3.text.substring(1),
        controller2.text,
        controller6.text,
        _value);
    if (response['status'] == 'ok') {
      Navigator.pop(context);
    } else {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Извините",
        desc:
            "Не удалось создать точку, возможно точка с данным номером телефона уже существует!",
        buttons: [
          DialogButton(
            child: Text(
              "Ок",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: AppColors.lightRed,
          ),
        ],
      ).show();
    }
  }
}
