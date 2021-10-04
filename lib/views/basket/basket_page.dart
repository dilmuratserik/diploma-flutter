import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/basket_product_item.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/const.dart';

import 'checkout_page.dart';


class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  List<Product> products = [
    Product(
        "Хиты продаж",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Сырная продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Рыбная продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Мясная продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Снековая продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column( children: [
          Container(
            height: MediaQuery.of(context).size.height*0.69,
            child: ListView.builder(itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => BasketProductItem(products[index])
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Text('2900 ₸', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
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
        ]
      ),
    );
  }
}
