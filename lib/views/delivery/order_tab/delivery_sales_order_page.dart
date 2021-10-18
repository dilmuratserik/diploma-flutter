import 'package:flutter/material.dart';
import 'package:mobile/views/sales_rep/order_page/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/order_page/sales_order_item.dart';
 import 'package:mobile/views/utills/const.dart';

import 'delivery_sales_order_item.dart';

class DeliverySalesOrderPage extends StatefulWidget {
   const DeliverySalesOrderPage({Key? key,
  }) : super(key: key);

  @override
  _DeliverySalesOrderPageState createState() => _DeliverySalesOrderPageState();
}

class _DeliverySalesOrderPageState extends State<DeliverySalesOrderPage> with TickerProviderStateMixin {

  @override
  void initState() {
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
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return DeliverySalesOrderItem();
        }
      ),
    );
  }

}