import 'package:flutter/material.dart';
import 'package:mobile/components/orderItem.dart';
import 'package:mobile/models/plan_model.dart';
import 'package:mobile/services/orders_api_provider.dart';
import 'package:mobile/services/plans_api_provider.dart';
import 'package:mobile/views/sales_rep/order_page/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/visits_tab/plane_item.dart';
import 'package:mobile/views/utills/const.dart';

import 'fact_item.dart';

class VisitsMainPage extends StatefulWidget {
  const VisitsMainPage({Key? key}) : super(key: key);

  @override
  _VisitsMainPageState createState() => _VisitsMainPageState();
}

class _VisitsMainPageState extends State<VisitsMainPage> {
  List<Plan> plans = [];

  @override
  void initState() {
    getPlans();
    super.initState();
  }

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
                      itemCount: plans.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PlaneItem(plan: plans[index]);
                      }),
                ),
                Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: plans.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FactItem(plan: plans[index]);
                      }),
                ),
              ]))
            ]));
  }

  void getPlans() async {
    var response = await PlansProvider().getPlan();
    print(response);
    if (response['status'] == 'ok') {
      List<Plan> ordersFromRes = [];
      for (var i in response['data']) {
        ordersFromRes.add(Plan.fromJson(i));
      }
      setState(() {
        plans = ordersFromRes;
      });
    }
  }
}
