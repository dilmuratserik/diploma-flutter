import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/appBar.dart';
import 'package:mobile/components/listTileEntry.dart';
import 'package:mobile/components/product_item.dart';
import 'package:mobile/models/entry_model.dart';
import 'package:mobile/models/product_model.dart';


class CategoryProductsPage extends StatelessWidget {
  final String title;

  CategoryProductsPage({required this.title});

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
      appBar:
        AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(title, style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
      body: Column(children: [
        for (int i = 0; i < 2; i++) ProductItem(products[i])
      ],)
    );
  }
}