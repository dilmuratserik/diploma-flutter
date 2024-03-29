import 'package:flutter/material.dart';
import 'package:mobile/models/plan_model.dart';
import 'package:mobile/views/sales_rep/visits_tab/plane_description.dart';
import 'package:mobile/views/utills/const.dart';

class FactItem extends StatefulWidget {
  const FactItem({Key? key, required this.plan}) : super(key: key);
  final Plan plan;

  @override
  _FactItemState createState() => _FactItemState();
}

class _FactItemState extends State<FactItem> {
  bool _switchValue1 = true;
  bool _switchValue2 = true;
  bool _switchValue3 = true;

  @override
  void initState() {
    widget.plan.plan ? _switchValue1 = true : _switchValue1 = false;
    widget.plan.fact ? _switchValue2 = true : _switchValue2 = false;
    widget.plan.fact ? _switchValue3 = true : _switchValue3 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlaneDescriptionPage(plan: widget.plan)));
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
                      "Код: " + widget.plan.id.toString(),
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
                              widget.plan.date,
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "План",
                            style: TextStyle(fontSize: 14),
                          ),
                          Switch(
                              value: _switchValue1,
                              activeColor: AppColors.gold,
                              onChanged: (value) {})
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Факт",
                            style: TextStyle(fontSize: 14),
                          ),
                          Switch(
                              value: _switchValue1,
                              activeColor: AppColors.gold,
                              onChanged: (value) {})
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Фото",
                            style: TextStyle(fontSize: 14),
                          ),
                          Switch(
                              value: _switchValue1,
                              activeColor: AppColors.gold,
                              onChanged: (value) {})
                        ]),
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
                        widget.plan.pointName,
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
