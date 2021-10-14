import 'package:flutter/material.dart';
import 'package:mobile/views/sales_rep/points_tab/point_item.dart';

class PointsMainPage extends StatefulWidget {
  const PointsMainPage({Key? key}) : super(key: key);

  @override
  _PointsMainPageState createState() => _PointsMainPageState();
}

class _PointsMainPageState extends State<PointsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return PointItem();
        }
      ),
    );
  }
}
