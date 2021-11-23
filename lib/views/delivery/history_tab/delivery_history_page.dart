import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/services/courier_api_provider.dart';
import 'package:mobile/views/sales_rep/order_page/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/order_page/sales_order_item.dart';
import 'package:mobile/views/utills/const.dart';

import 'delivery_history_item.dart';

class DeliveryOrderHistoryPage extends StatefulWidget {
  const DeliveryOrderHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  _DeliveryOrderHistoryPageState createState() =>
      _DeliveryOrderHistoryPageState();
}

class _DeliveryOrderHistoryPageState extends State<DeliveryOrderHistoryPage>
    with TickerProviderStateMixin {
  List<OrderSalesRep> orders = [];

  @override
  void initState() {
    getHistoryOrders();
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
            return DeliveryHistoryItem(order: orders[index]);
          }),
    );
  }

  void getHistoryOrders() async {
    var response = await CourierProvider().getHistoryOrders();
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
