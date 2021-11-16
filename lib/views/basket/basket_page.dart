import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/basket_product_item.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/basket_order_model.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'checkout_page.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  List<BasketOrder> products = [];
  Timer? timer;

  int amount = 0;

  List<String> categoryTitles = [
    "Снековая продукция",
    "Сырная продукция",
    "Рыбная продукция",
    "Мясная продукция"
  ];

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) => getBasket());
    products = AppConstants.basket;
    for (var i in products) {
      amount += i.product.price * i.count;
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  getBasket() {
    amount = 0;
    setState(() {
      products = AppConstants.basket;
      for (var i in products) {
        amount += i.product.price * i.count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.69,
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) =>
                  BasketProductItem(products[index],
                      categoryTitles[products[index].product.category])),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(amount.toString() + ' ₸',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (products.length > 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(products)));
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Извините",
                      desc: "Корзина пуста!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Понятно",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                        ),
                      ],
                    ).show();
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: AppColors.green,
                    padding: EdgeInsets.only(left: 18, right: 18),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    )),
                child: Text(
                  "ОФОРМИТЬ ЗАКАЗ",
                ),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
