import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:mobile/views/delivery/order_tab/delivery_sales_order_page.dart';
import 'package:mobile/views/delivery/points_tab/delivery_points_page.dart';
import 'package:mobile/views/sales_rep/points_tab/points_main_page.dart';
import 'package:mobile/views/sales_rep/visits_tab/visits_main_page.dart';
import 'package:mobile/views/utills/const.dart';

import 'home_page/sales_home_page.dart';
import 'list_of_payments_page.dart/list_of_payments_page.dart';
import 'order_page/sales_order_page.dart';
import 'order_page/test_sliverapp.dart';

class SalesMainMenuPage extends StatefulWidget {
  const SalesMainMenuPage({Key? key}) : super(key: key);

  @override
  _SalesMainMenuPageState createState() => _SalesMainMenuPageState();
}

class _SalesMainMenuPageState extends State<SalesMainMenuPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  var _role = 1;

  static const List<Widget> _widgetCourier = [
    TestSiverApp(),
     DeliverySalesOrderPage(),
     DeliveryPointsMainPage(),
     ListOfPaymentsPage()
  ];

  static const List<Widget> _widgetSales = [
      SalesHomePage(),
     SalesOrderPage(),
     VisitsMainPage(),
     PointsMainPage()
   ];

   void refresh() {
     print("asda");
  }

  static const List<String> _pageNames = <String>[
    "Главная",
    'Заказы',
    'Визиты',
    'Точки',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        _pageNames[_selectedIndex],
        style: TextStyle(color: AppColors.green),
      ),
      leading: GestureDetector(
          onTap: () {
            _key.currentState!.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black45,
          )),
      actions: [
        _selectedIndex == 0
            ? GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    // child: Icon(Icons.search, color: Colors.black,),
                    child: searchBar.getSearchAction(context)),
              )
            : _selectedIndex == 1
                ? GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(  horizontal: 10),
                        child: Text(
                          "Создать",
                          style: TextStyle(color: AppColors.green, fontSize: 18),
                        ),
                      ),
                    )) : Container(),
      ],
      // title: new Text('My Home Page'),
      // actions:
    );
  }

  _SalesMainMenuPageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: searchBar.build(context),
      body: _role == 1 ?_widgetSales.elementAt(_selectedIndex) : _widgetCourier.elementAt(_selectedIndex),
      drawer:  _role == 1 ? getSalesDrawer() : getCourierDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: _pageNames[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: _pageNames[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: _pageNames[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: _pageNames[3],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget getCourierDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 125,
            padding: EdgeInsets.only(top: 60, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Маратов Марат",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text("+77081622547",
                    style: TextStyle(
                        color: AppColors.presentationGray, fontSize: 15))
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.payments),
            title: const Text("Список оплат", style: TextStyle(fontSize: 16),),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: const Text("Настройки", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text("Выйти", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget getSalesDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 125,
            padding: EdgeInsets.only(top: 60, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Маратов Марат",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text("+77081622547",
                    style: TextStyle(
                        color: AppColors.presentationGray, fontSize: 15))
              ],
            ),

          ),
          ListTile(
            leading: Icon(Icons.payments),
            title: const Text("Список оплат", style: TextStyle(fontSize: 16),),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.my_location),
            title: const Text("Карта объектов", style: TextStyle(fontSize: 16)),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text("Настройки", style: TextStyle(fontSize: 16)),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text("Выйти", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.black,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
