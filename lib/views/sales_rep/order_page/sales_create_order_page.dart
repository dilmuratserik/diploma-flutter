import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
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
  TextEditingController fourthController = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

  bool _switchValue2 = false;

  var isVisible = false;
  var countProduct = 0;
  Object? _value = 1;

  List<String> items = ["asd", "asssd"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Чтобы создать новый заказ, пожалуйста заполните поля",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Container(
                  child: TextFormField(
                    controller: firstController,
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
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
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
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 60,
                  child: InputDecorator(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 16),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.gold, width: 1))),
                      isEmpty: false,
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Торговая точка 1"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Торговая точка 2"),
                                  value: 2,
                                )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                              hint: Text("Торговая точка")))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  child: TextFormField(
                    readOnly: true,
                    controller: secondController,
                    cursorColor: Colors.black,
                    enableSuggestions: false,
                    autocorrect: false,
                    maxLength: 30,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2020, 11, 17),
                              firstDate: DateTime(2017, 1),
                              lastDate: DateTime(2022, 7),
                              helpText: 'Выберите дату',
                            );
                            secondController.text =
                                newDate.toString().substring(0, 10);
                          },
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: thirdFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Дата заказа",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
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
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  child: TextFormField(
                    readOnly: true,
                    controller: thirdController,
                    cursorColor: Colors.black,
                    enableSuggestions: false,
                    autocorrect: false,
                    maxLength: 30,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2020, 11, 17),
                              firstDate: DateTime(2017, 1),
                              lastDate: DateTime(2022, 7),
                              helpText: 'Выберите дату',
                            );
                            thirdController.text =
                                newDate.toString().substring(0, 10);
                          },
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: thirdFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Дата доставки",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
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
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "С документами?",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                          value: _switchValue2,
                          activeColor: AppColors.gold,
                          onChanged: (value) {
                            setState(() {
                              _switchValue2 = value;
                            });
                            print("value ${value}");
                          })
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  child: TextFormField(
                    controller: fourthController,
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
                        labelText: "Комментарии",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
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
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Содержание заказа",
                    style: TextStyle(
                        color: AppColors.presentationGray, fontSize: 16),
                  ),
                ),
              ),
              for (int i = 0; i < countProduct; i++)
                getMeaningOrder("1х Коса копченая, Золото колчака", "500 ₸"),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 5, left: 5, right: 5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVisible = true;
                      countProduct = 3;
                    });
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
                  child: Text("Добавить товары"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          30), // double.infinity is the width and 30 is the height
                      primary: AppColors.green,
                      padding: EdgeInsets.symmetric(vertical: 17),
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto")),
                  child: Text('Создать'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  var txt = "asd";

  Widget showDropDown() {
    return PopupMenuButton(
      offset: Offset(0, 52),
      icon: Icon(Icons.keyboard_arrow_down),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Container(
              width: MediaQuery.of(context).size.height, child: Text('Item 1')),
        ),
        PopupMenuItem(
          child: Text('Item 2'),
        ),
      ],
    );
  }

  Widget getMeaningOrder(String text, String price) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            text,
            style: TextStyle(fontSize: 18),
            maxLines: 5,
            softWrap: true,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(price, style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}
