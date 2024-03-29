import 'package:flutter/material.dart';
import 'package:mobile/models/point_model.dart';
import 'package:mobile/views/sales_rep/points_tab/point_creating_page.dart';
import 'package:mobile/views/utills/const.dart';

class PointItem extends StatefulWidget {
  const PointItem({Key? key, required this.point}) : super(key: key);
  final Point point;

  @override
  _PointItemState createState() => _PointItemState();
}

class _PointItemState extends State<PointItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Код: " + widget.point.binIin,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          "Долг: " + widget.point.debt.toString() + " тг",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: AppColors.gold,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.76,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.point.name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
