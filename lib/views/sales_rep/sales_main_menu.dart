import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

class SalesMainPage extends StatefulWidget {
  const SalesMainPage({Key? key}) : super(key: key);

  @override
  _SalesMainPageState createState() => _SalesMainPageState();
}

class _SalesMainPageState extends State<SalesMainPage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                "assets/images/person.jpg",
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.2,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 4, right: 4, top: 16, left: 16),
              child: Text(
                "Маратов Марат",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.call,
                    color: AppColors.presentationGray,
                    size: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text("+77081622547",
                        style: TextStyle(
                            color: AppColors.presentationGray, fontSize: 15)),
                  ),
                ],
              ),
            ),
            DefaultTabController(
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
                            Tab(text: "ОБо мне".toUpperCase()),
                            Tab(text: "Рейтинг".toUpperCase()),
                          ],
                        ),
                      ),
                      Container(
                          height: 450,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getTitle("Регион"),
                                  getSubtitle("Алматы, склад Алматы"),
                                  getDivider(),
                                  getTitle("Тип цены"),
                                  getSubtitle("Розница"),
                                  getDivider(),
                                  getTitle("Сектор заказа"),
                                  getSubtitle("Супермаркет"),
                                  getDivider(),
                                  getTitle("Время работы"),
                                  getSubtitle("С 9:00 до 12:00"),
                                  getDivider(),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 0, left: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Включить GPS навигатор?",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Switch(
                                              value: _switchValue1,
                                              activeColor: AppColors.gold,
                                              onChanged: (value) {
                                                setState(() {
                                                  _switchValue1 = value;
                                                });
                                                print("value ${value}");
                                              })
                                        ]),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 0, left: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Привязан телефон?",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Switch(
                                              value: _switchValue2,
                                              activeColor: AppColors.gold,
                                              onChanged: (value) {
                                                setState(() {
                                                  _switchValue2 = value;
                                                });
                                                print("value ${value}");
                                              })
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 23',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ],
        ),
      ),
    );
  }

  Widget getDivider() {
    return Divider(
      color: AppColors.presentationGray,
      indent: 8,
      endIndent: 8,
    );
  }

  Widget getTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Text(
        text,
        style: TextStyle(color: AppColors.presentationGray, fontSize: 16),
      ),
    );
  }

  Widget getSubtitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16)),
    );
  }
}
