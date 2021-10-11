import 'package:flutter/material.dart';
import 'package:mobile/components/orderItem.dart';
import 'package:mobile/views/sales_rep/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/sales_order_item.dart';
import 'package:mobile/views/sales_rep/visits_tab/plane_item.dart';
import 'package:mobile/views/utills/const.dart';

import 'fact_item.dart';

class VisitsMainPage extends StatefulWidget {
  const VisitsMainPage({Key? key}) : super(key: key);

  @override
  _VisitsMainPageState createState() => _VisitsMainPageState();
}

class _VisitsMainPageState extends State<VisitsMainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: AppColors.green,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: AppColors.green,
                  tabs: [
                    Tab(text: "План".toUpperCase()),
                    Tab(text: "Факт".toUpperCase()),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(children: <Widget>[
                Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return PlaneItem();
                      }),
                ),
                Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return FactItem();
                      }),
                ),
              ]))
            ]));
  }


}
