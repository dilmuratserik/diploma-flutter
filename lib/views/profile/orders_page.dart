import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/orderItem.dart';
import 'package:mobile/models/order_model.dart';

class OrdersPage extends StatefulWidget {
  // OrdersPage(this.product);
  // final Product product;

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  List<Order> orders = [
    Order("32443745",
        "21 мая 2021 12:00",
        "доставлен",
        "1500"),
    Order("32443745",
        "21 мая 2021 12:00",
        "доставлен",
        "1500"),
    Order("32443745",
        "21 мая 2021 12:00",
        "доставлен",
        "1500"),
  ];

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
          title: Text('Заказы', style: TextStyle(color: Colors.black, fontSize: 18)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: Column(children: [
        for (int i = 0; i < 2; i++) OrderItem(orders[i])
      ],)
        )
    );
  }
}