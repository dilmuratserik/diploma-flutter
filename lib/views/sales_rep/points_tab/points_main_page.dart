import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/point_model.dart';
import 'package:mobile/services/orders_api_provider.dart';
import 'package:mobile/services/points_api_provider.dart';
import 'package:mobile/views/sales_rep/points_tab/point_creating_page.dart';
import 'package:mobile/views/sales_rep/points_tab/point_item.dart';
import 'package:mobile/views/utills/const.dart';

class PointsMainPage extends StatefulWidget {
  const PointsMainPage({Key? key}) : super(key: key);

  @override
  _PointsMainPageState createState() => _PointsMainPageState();
}

class _PointsMainPageState extends State<PointsMainPage> {
  List<Point> points = [];

  @override
  void initState() {
    getPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: points.length,
                itemBuilder: (BuildContext context, int index) {
                  return PointItem(point: points[index]);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PointCreatingPage()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,
                        30), // double.infinity is the width and 30 is the height
                    primary: AppColors.green,
                    padding: EdgeInsets.symmetric(vertical: 17),
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto")),
                child: Text('ДОБАВИТЬ ТОЧКУ'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getPoints() async {
    var response = await PointsProvider().getPoints();
    print(response);
    if (response['status'] == 'ok') {
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
