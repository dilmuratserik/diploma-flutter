import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/services/courier_api_provider.dart';
import 'package:mobile/views/sales_rep/order_page/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/order_page/sales_order_item.dart';
import 'package:mobile/views/utills/const.dart';

import 'delivery_sales_order_item.dart';

class DeliverySalesOrderPage extends StatefulWidget {
  const DeliverySalesOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  _DeliverySalesOrderPageState createState() => _DeliverySalesOrderPageState();
}

class _DeliverySalesOrderPageState extends State<DeliverySalesOrderPage>
    with TickerProviderStateMixin {
  List<OrderSalesRep> orders = [];

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return DeliverySalesOrderItem(order: orders[index]);
          }),
    );
  }

  void getOrders() async {
    var response = await CourierProvider().getOrders();
    if (response['status'] == 'ok') {
      List<OrderSalesRep> ordersFromRes = [];
      for (var i in response['data']) {
        ordersFromRes.add(OrderSalesRep.fromJson(i));
      }
      setState(() {
        orders = ordersFromRes;
      });
    }
  }
}
