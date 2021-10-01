import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/models/order_model.dart';

class OrderInfoPage extends StatefulWidget {
  OrderInfoPage(this.order);
  final Order order;

  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {

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
          title: Text('Заказ', style: TextStyle(color: Colors.black, fontSize: 18)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: Column(
          children: [

          ]),
        )
    );
  }
}