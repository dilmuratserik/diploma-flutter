import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/basket_order_model.dart';
import 'package:mobile/services/orders_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage(this.order);
  final List<BasketOrder> order;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Object? value1 = 1;
  Object? value2 = 1;
  bool _switchValue1 = false;
  TextEditingController commentController = TextEditingController();
  FocusNode commentFocusNode = FocusNode();

  int amount = 0;

  @override
  void initState() {
    for (var i in widget.order) {
      amount += i.product.price * i.count;
    }
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
              title: Text('Оформления',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height +
                  double.parse((10 + 80 * widget.order.length).toString()),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Container(
                          decoration:
                              BoxDecoration(color: HexColor.fromHex('EEF3F1')),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, bottom: 5),
                                    child: Text('Заказ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  // Spacer(),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       top: 20,
                                  //       left: 20,
                                  //       bottom: 5,
                                  //       right: 20),
                                  //   child: Text('№12312312',
                                  //       style: TextStyle(
                                  //           fontSize: 20,
                                  //           color: AppColors.green,
                                  //           fontWeight: FontWeight.w600)),
                                  // ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, bottom: 5),
                                  child: Text('Содержание заказа',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ),
                                Container(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: double.parse(
                                            (10 + 60 * widget.order.length)
                                                .toString()),
                                        minHeight: 60),
                                    child: ListView.builder(
                                      itemCount: widget.order.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 6),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Text(
                                                    widget.order[index].count
                                                            .toString() +
                                                        'x ' +
                                                        widget.order[index]
                                                            .product.name,
                                                    style: TextStyle(
                                                        fontSize: 18))),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 6),
                                            child: Text(
                                                (widget.order[index].product
                                                                .price *
                                                            widget.order[index]
                                                                .count)
                                                        .toString() +
                                                    ' ₸',
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 6, bottom: 30),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text('Итог:',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 6),
                                      child: Text(amount.toString() + ' ₸',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, bottom: 5),
                      child: Text('Способ доставки',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SizedBox(
                        height: 60,
                        child: InputDecorator(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            isEmpty: false,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: value1,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Самовывоз"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Yandex"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Glovo"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Wolt"),
                                        value: 4,
                                      )
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        value1 = value;
                                      });
                                    },
                                    hint: Text("Способ доставки")))),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, bottom: 5),
                      child: Text('Способ оплаты',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SizedBox(
                        height: 60,
                        child: InputDecorator(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            isEmpty: false,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: value2,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Наличными"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Картой Visa/MasterCard"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child:
                                            Text("Оплата в системе Kaspi.kz"),
                                        value: 2,
                                      )
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        value2 = value;
                                      });
                                    },
                                    hint: Text("Способ оплаты")))),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                      child: Text('Бонусы: 24 тг',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 20, bottom: 5, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Использовать бонусы",
                              style: TextStyle(fontSize: 16),
                            ),
                            Switch(
                                value: _switchValue1,
                                activeColor: AppColors.gold,
                                onChanged: (value) {
                                  setState(() {
                                    _switchValue1 = value;
                                  });
                                  print("value ${value}");
                                })
                          ]),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                      child: Text('Дополнительные комментарии',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Container(
                          child: TextFormField(
                            onTap: () {},
                            focusNode: commentFocusNode,
                            controller: commentController,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: commentFocusNode.hasFocus
                                        ? AppColors.gold
                                        : Colors.grey),
                                focusColor: Colors.grey,
                                fillColor: Colors.grey,
                                counterText: "",
                                labelText: "Комментарий",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.gold, width: 1))),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Заполните это поле';
                            //   }
                            //   return null;
                            // },
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Center(
                          child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            createOrder();
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
                          child: Text('ОПЛАТИТЬ ' + amount.toString() + ' ₸'),
                        ),
                      )),
                    ),
                  ]),
            ),
          ),
        ));
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
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
        ],
      ).show();
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await OrdersProvider().createOrder(
          int.parse(value1.toString()), prefs.getInt('user_id')!, widget.order);
      if (response['status'] == 'ok') {
        AppConstants.basket = [];
        AppConstants.basketIDs = [];
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
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
          ],
        ).show();
      }
    }
  }
}
