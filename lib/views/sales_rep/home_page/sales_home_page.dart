import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/services/profile_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SalesHomePage extends StatefulWidget {
  const SalesHomePage({Key? key}) : super(key: key);

  @override
  _SalesHomePageState createState() => _SalesHomePageState();
}

class _SalesHomePageState extends State<SalesHomePage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;

  late List<SalesData> _chartData;
  late List<SalesData> _chartData2;
  late TooltipBehavior _tooltipBehavior;

  final ImagePicker _picker = ImagePicker();

  String name = AppConstants.name;
  String phone = AppConstants.phone;
  String ava = AppConstants.ava;
  String region = '';
  String priceType = '';
  String orderSector = '';
  int role = 1;

  void getProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.get('user_id');
    Map<String, dynamic> response =
        await ProfileProvider().getProfileInfo(id.toString());

    if (response['status'] != 'Error') {
      prefs.setString('name', response['name'].toString());
      prefs.setString('ava', response['avatar']);
      prefs.setInt('country', response['country']);
      prefs.setInt("city", response['city']);
      AppConstants.name = response['name'];
      AppConstants.phone = response['phone'];
      AppConstants.ava = response['avatar'];
      role = response["role"];
      prefs.setInt('role', role);
      if (role == 2) {
        prefs.setString("bin_iin", response["bin_iin"].toString());
      }
      setState(() {
        name = response['name'];
        phone = response['phone'];
        ava = response['avatar'];
        region = response['locations'].toString();

        if (response['type_price'] == 1) {
          priceType = 'Розница';
        } else if (response['type_price'] == 2) {
          priceType = 'Оптовый';
        } else {
          priceType = 'Спец. цена';
        }

        if (response['order_sector'] == 1) {
          orderSector = 'Пивнушка';
        } else if (response['order_sector'] == 2) {
          orderSector = 'Магазин';
        } else {
          orderSector = 'Супермаркет';
        }
      });
    }
  }

  @override
  void initState() {
    getProfileInfo();
    _chartData = getChartData();
    _chartData2 = getChartData2();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      minRadius: MediaQuery.of(context).size.width / 8,
                      backgroundImage: getImage(),
                    ),
                    // AssetImage(
                    //     "assets/images/person.jpg")
                    Positioned(
                      top: 70,
                      left: 65,
                      child: CircleButton(
                          onTap: () async {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: new Icon(Icons.photo),
                                        title: new Text('Gallery'),
                                        onTap: () async {
                                          Navigator.pop(context);

                                          XFile? avatar =
                                              await _picker.pickImage(
                                                  source: ImageSource.gallery);
                                          setState(() {
                                            if (avatar != null)
                                              ava = avatar.path;
                                          });

                                          List<int> imageBytes =
                                              File(ava).readAsBytesSync();
                                          String base64Image =
                                              base64Encode(imageBytes);
                                          changeAvater(base64Image);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(Icons.camera_alt),
                                        title: new Text('Camera'),
                                        onTap: () async {
                                          Navigator.pop(context);

                                          XFile? avatar =
                                              await _picker.pickImage(
                                                  source: ImageSource.camera);

                                          setState(() {
                                            if (avatar != null)
                                              ava = avatar.path;
                                          });

                                          List<int> imageBytes =
                                              File(ava).readAsBytesSync();
                                          String base64Image =
                                              base64Encode(imageBytes);
                                          changeAvater(base64Image);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          iconData: Icon(Icons.edit, color: AppColors.green)),
                    )
                  ]),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 4, right: 4, top: 16, left: 16),
                        child: Text(
                          name,
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
                              child: Text('+' + phone,
                                  style: TextStyle(
                                      color: AppColors.presentationGray,
                                      fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   child: Image.asset(
            //     "assets/images/person.jpg",
            //     fit: BoxFit.fitWidth,
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height / 3.2,
            //   ),
            // ),

            DefaultTabController(
                length: role == 3 ? 2 : 1, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          labelColor: AppColors.green,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: AppColors.green,
                          tabs: role == 3
                              ? [
                                  Tab(text: "ОБо мне".toUpperCase()),
                                  Tab(text: "Рейтинг".toUpperCase()),
                                ]
                              : [
                                  Tab(text: "ОБо мне".toUpperCase()),
                                ],
                        ),
                      ),
                      Container(
                          height: 450,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(
                              children: role == 3
                                  ? <Widget>[
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            getTitle("Регион"),
                                            getSubtitle(region),
                                            getDivider(),
                                            getTitle("Тип цены"),
                                            getSubtitle(priceType),
                                            getDivider(),
                                            getTitle("Сектор заказа"),
                                            getSubtitle(orderSector),
                                            getDivider(),
                                            getTitle("Время работы"),
                                            getSubtitle("С 9:00 до 20:00"),
                                            getDivider(),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.only(top: 0, left: 16),
                                            //   child: Row(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.spaceBetween,
                                            //       children: [
                                            //         Text(
                                            //           "Включить GPS навигатор?",
                                            //           style: TextStyle(fontSize: 18),
                                            //         ),
                                            //         Switch(
                                            //             value: _switchValue1,
                                            //             activeColor: AppColors.gold,
                                            //             onChanged: (value) {
                                            //               setState(() {
                                            //                 _switchValue1 = value;
                                            //               });
                                            //               print("value ${value}");
                                            //             })
                                            //       ]),
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.only(top: 0, left: 16),
                                            //   child: Row(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.spaceBetween,
                                            //       children: [
                                            //         Text(
                                            //           "Привязан телефон?",
                                            //           style: TextStyle(fontSize: 18),
                                            //         ),
                                            //         Switch(
                                            //             value: _switchValue2,
                                            //             activeColor: AppColors.gold,
                                            //             onChanged: (value) {
                                            //               setState(() {
                                            //                 _switchValue2 = value;
                                            //               });
                                            //               print("value ${value}");
                                            //             })
                                            //       ]),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                            width: 800,
                                            child: SfCartesianChart(
                                              // title: ChartTitle(text: 'Yearly sales analysis'),
                                              legend: Legend(isVisible: false),
                                              tooltipBehavior: _tooltipBehavior,
                                              series: <
                                                  ChartSeries<SalesData,
                                                      String>>[
                                                LineSeries<SalesData, String>(
                                                    dataSource: _chartData,
                                                    xValueMapper:
                                                        (SalesData sales, _) =>
                                                            sales.month,
                                                    yValueMapper:
                                                        (SalesData sales, _) =>
                                                            sales.sales,
                                                    dataLabelSettings:
                                                        DataLabelSettings(
                                                            isVisible: true),
                                                    enableTooltip: false),
                                                LineSeries<SalesData, String>(
                                                    dataSource: _chartData2,
                                                    xValueMapper:
                                                        (SalesData sales, _) =>
                                                            sales.month,
                                                    yValueMapper:
                                                        (SalesData sales, _) =>
                                                            sales.sales,
                                                    dataLabelSettings:
                                                        DataLabelSettings(
                                                            isVisible: true),
                                                    enableTooltip: false)
                                              ],
                                              primaryXAxis: CategoryAxis(),
                                              // primaryXAxis: NumericAxis(
                                              //   edgeLabelPlacement: EdgeLabelPlacement.shift,
                                              // ),
                                            )),
                                      ),
                                    ]
                                  : [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            getTitle("Регион"),
                                            getSubtitle(region),
                                            getDivider(),
                                            getTitle("Тип цены"),
                                            getSubtitle(priceType),
                                            getDivider(),
                                            getTitle("Сектор заказа"),
                                            getSubtitle(orderSector),
                                            getDivider(),
                                            getTitle("Время работы"),
                                            getSubtitle("С 9:00 до 20:00"),
                                            getDivider(),
                                          ],
                                        ),
                                      ),
                                    ]))
                    ])),
          ],
        ),
      ),
    );
  }

  getImage() {
    if (ava.startsWith("http")) {
      return NetworkImage(ava);
    } else {
      var file = FileImage(File(ava));
      return file;
    }
  }

  void changeAvater(String ava) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.get('user_id')!;
    int country = prefs.getInt('country')!;
    int city = prefs.getInt("city")!;
    String role = prefs.getString("role")!;
    print(country);
    print(city);

    Map<String, dynamic> response = await ProfileProvider()
        .changeUserInfo(ava, name, country, city, role, id.toString());

    if (response['status'] == 'ok') {
      print("response " + response.toString());
    }
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

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData("Январь", 25),
      SalesData("Февраль", 12),
      SalesData("Март", 24),
      SalesData("Апрель", 18),
      SalesData("Май", 30),
      SalesData("Июнь", 15),
      SalesData("Июль", 30),
      SalesData("Август", 52),
      SalesData("Сентябрь", 35),
      SalesData("Октябрь", 22),
      SalesData("Ноябрь", 22),
      SalesData("Декабрь", 22)
    ];
    return chartData;
  }

  List<SalesData> getChartData2() {
    final List<SalesData> chartData = [
      SalesData("Январь", 12),
      SalesData("Февраль", 56),
      SalesData("Март", 48),
      SalesData("Апрель", 21),
      SalesData("Май", 5),
      SalesData("Июнь", 64),
      SalesData("Июль", 13),
      SalesData("Август", 20),
      SalesData("Сентябрь", 15),
      SalesData("Октябрь", 35),
      SalesData("Ноябрь", 40),
      SalesData("Декабрь", 32)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Icon iconData;

  const CircleButton({Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
        onTap: onTap,
        child: new Container(
            // width: size,
            // height: size,
            decoration: new BoxDecoration(
              color: AppColors.lightGray,
              shape: BoxShape.circle,
            ),
            child: iconData));
  }
}
