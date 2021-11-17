import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/services/orders_api_provider.dart';
import 'package:mobile/views/sales_rep/order_page/sales_create_order_page.dart';
import 'package:mobile/views/sales_rep/order_page/sales_order_item.dart';
import 'package:mobile/views/utills/const.dart';

class SalesOrderPage extends StatefulWidget {
  const SalesOrderPage({
    Key? key,
  }) : super(key: key);

  // final VoidCallback showAction;
  // final Function() showActions;

  @override
  _SalesOrderPageState createState() => _SalesOrderPageState();
}

class _SalesOrderPageState extends State<SalesOrderPage>
    with TickerProviderStateMixin {
  List<OrderSalesRep> orders = [];

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                      itemCount: orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SalesOrderItem(order: orders[index]);
                      }),
                ),
                SalesCreateOrderPage(),
              ])),
            ]));
  }

  void getOrders() async {
    var response = await OrdersProvider().getOrdersBySalesRep();
    if (response['status'] == 'ok') {
      List<OrderSalesRep> ordersFromRes = [];
      for (var i in response['data']) {
        ordersFromRes.add(OrderSalesRep.fromJson(i));
      }
      setState(() {
        orders = ordersFromRes;
      });
    }
  }
}
