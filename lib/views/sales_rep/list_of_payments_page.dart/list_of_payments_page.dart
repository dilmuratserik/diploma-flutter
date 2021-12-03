import 'package:flutter/material.dart';
import 'package:mobile/views/sales_rep/list_of_payments_page.dart/payment_item.dart';
import 'package:mobile/views/utills/const.dart';

class ListOfPaymentsPage extends StatefulWidget {
  const ListOfPaymentsPage({Key? key}) : super(key: key);

  @override
  _ListOfPaymentsPageState createState() => _ListOfPaymentsPageState();
}

class _ListOfPaymentsPageState extends State<ListOfPaymentsPage> {

  bool showTabBar = true;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Список оплат',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              brightness: Brightness.light,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body:
          showTabBar ? DefaultTabController(
              length: 3, // length of tabs
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
                          Tab(text: "Доставлен".toUpperCase()),
                          Tab(text: "В обработке".toUpperCase()),
                          Tab(text: "Новый".toUpperCase()),
                          // Tab(text: "Факт".toUpperCase()),
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
                                  return PaymentItem();
                                }),
                          ),
                          Container(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: 20,
                                itemBuilder: (BuildContext context, int index) {
                                  return PaymentItem();
                                }
                            ),
                          ),
                          Container(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: 20,
                                itemBuilder: (BuildContext context, int index) {
                                  return PaymentItem();
                                }
                            ),
                          ),
                        ]
                        )
                    )
                  ]
              )
          ) : Center(child: Text(
              'Список оплат вам недоступен. Свяжитесь с администрацией Galleon.',
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center))
      );
  }
}