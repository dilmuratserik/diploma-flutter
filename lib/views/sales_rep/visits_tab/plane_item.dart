import 'package:flutter/material.dart';
import 'package:mobile/views/sales_rep/visits_tab/plane_description.dart';
import 'package:mobile/views/utills/const.dart';

class PlaneItem extends StatefulWidget {
  const PlaneItem({Key? key}) : super(key: key);

  @override
  _PlaneItemState createState() => _PlaneItemState();
}

class _PlaneItemState extends State<PlaneItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlaneDescriptionPage()));
      },
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
                      "Код: 465",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: AppColors.green,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              "27.09.2021",
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
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
                        'Бегалиев 5, Морошкин магазинa',
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
