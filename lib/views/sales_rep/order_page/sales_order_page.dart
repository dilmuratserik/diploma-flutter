import 'package:flutter/material.dart';
import 'package:mobile/views/sales_rep/order_page/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/order_page/sales_order_item.dart';
 import 'package:mobile/views/utills/const.dart';

class SalesOrderPage extends StatefulWidget {
   const SalesOrderPage({Key? key,
  }) : super(key: key);

  // final VoidCallback showAction;
  // final Function() showActions;

  @override
  _SalesOrderPageState createState() => _SalesOrderPageState();
}

class _SalesOrderPageState extends State<SalesOrderPage> {
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
                  onTap: (index) {
                    print("index ${index}");
                  },
                  labelColor: AppColors.green,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: AppColors.green,
                  tabs: [
                    Tab(text: "Заказы".toUpperCase()),
                    Tab(text: "Создать заказ".toUpperCase()),
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
                        return SalesOrderItem();
                      }),
                ),
                SalesCreateOrderPage(),
              ]))
            ]));
  }


}
