import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/basket_product_item.dart';
import 'package:mobile/models/product_model.dart';


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
      body: Column(children: [
        for (int i = 0; i < 2; i++) BasketProductItem(products[i])
      ],)
    );
  }
}
