import 'package:flutter/material.dart';
import 'package:mobile/views/sales_rep/points_tab/point_item.dart';

import 'delivery_point_item.dart';

class DeliveryPointsMainPage extends StatefulWidget {
  const DeliveryPointsMainPage({Key? key}) : super(key: key);

  @override
  _DeliveryPointsMainPageState createState() => _DeliveryPointsMainPageState();
}

class _DeliveryPointsMainPageState extends State<DeliveryPointsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return DeliveryPointItem();
        }
      ),
    );
  }
}
