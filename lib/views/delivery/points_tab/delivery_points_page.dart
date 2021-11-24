import 'package:flutter/material.dart';
import 'package:mobile/models/point_model.dart';
import 'package:mobile/services/courier_api_provider.dart';
import 'package:mobile/views/sales_rep/points_tab/point_item.dart';

import 'delivery_point_item.dart';

class DeliveryPointsMainPage extends StatefulWidget {
  const DeliveryPointsMainPage({Key? key}) : super(key: key);

  @override
  _DeliveryPointsMainPageState createState() => _DeliveryPointsMainPageState();
}

class _DeliveryPointsMainPageState extends State<DeliveryPointsMainPage> {
  List<Point> points = [];
  @override
  void initState() {
    getPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: points.length,
          itemBuilder: (BuildContext context, int index) {
            return DeliveryPointItem(point: points[index]);
          }),
    );
  }

  void getPoints() async {
    var response = await CourierProvider().getPoints();
    if (response['status'] == 'ok') {
      print(response);
      List<Point> ordersFromRes = [];
      for (var i in response['data']) {
        ordersFromRes.add(Point.fromJson(i));
      }
      setState(() {
        points = ordersFromRes;
      });
    }
  }
}
