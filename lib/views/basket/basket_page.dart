import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Basket"),
    );
  }
}
