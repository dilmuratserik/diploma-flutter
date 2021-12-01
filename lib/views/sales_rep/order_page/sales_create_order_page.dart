import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/basket_order_model.dart';
import 'package:mobile/services/orders_api_provider.dart';
import 'package:mobile/views/categories/categories_page.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<String> items = [];

  List<BasketOrder> products = [];

  @override
  void initState() {
    getPoinNames();
    products = AppConstants.basketSalesRep;
    products.length > 0 ? isVisible == true : isVisible = false;
    super.initState();
  }

  void refresh() {
    setState(() {
      products = AppConstants.basketSalesRep;
      products.length > 0 ? isVisible == true : isVisible = false;
    });
  }

  void getPoinNames() async {
    var response = await OrdersProvider().getPointNames();
    if (response['status'] == 'ok') {
      List<String> tempList = [];
      for (var i in response['data']) {
        tempList.add(i['name']);
      }

      setState(() {
        items = tempList;
      });
    }
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 22),
              //   child: Container(
              //     child: TextFormField(
              //       controller: firstController,
              //       cursorColor: Colors.black,
              //       enableSuggestions: false,
              //       autocorrect: false,
              //       maxLength: 30,
              //       decoration: InputDecoration(
              //           labelStyle: TextStyle(
              //               color: thirdFocusNode.hasFocus
              //                   ? AppColors.gold
              //                   : Colors.grey),
              //           focusColor: Colors.grey,
              //           fillColor: Colors.grey,
              //           counterText: "",
              //           labelText: "Номер заказа",
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(5.0),
              //               borderSide:
              //                   BorderSide(color: Colors.grey, width: 1)),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(color: AppColors.gold, width: 1))),
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Заполните это поле';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
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
              products.length != 0
                  ? Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Содержание заказа",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                    )
                  : Container(),
              for (int i = 0; i < products.length; i++)
                getMeaningOrder(
                    products[i].count.toString() +
                        "х " +
                        products[i].product.name,
                    products[i].product.price.toString() + " ₸"),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 5, left: 5, right: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoriesPage(isSalesRep: true)))
                        .whenComplete(() => refresh());
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
                  onPressed: () {
                    if (products.length != 0) {
                      createOrder();
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.red,
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

  void createOrder() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          ),
        ],
      ).show();
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await OrdersProvider()
          .createOrder(1, prefs.getInt('user_id')!, products);
      if (response['status'] == 'ok') {
        AppConstants.basketSalesRep = [];
        AppConstants.basketIDsSalesRep = [];
        Alert(
          context: context,
          type: AlertType.success,
          title: "Заказ принят!",
          desc: "Оплата успешно прошла.",
          buttons: [
            DialogButton(
              child: Text(
                "Перейти в главную",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: AppColors.green,
            ),
          ],
        ).show().whenComplete(() {
          setState(() {
            products = [];
            secondController.text = '';
            thirdController.text = '';
            fourthController.text = '';
          });
        });
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Внимание",
          desc: "Сервер временно не отвечает, повторите позже...",
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
}
