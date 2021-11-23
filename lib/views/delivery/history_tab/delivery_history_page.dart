import 'package:flutter/material.dart';
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
            return DeliveryHistoryItem();
          }),
    );
  }
}
