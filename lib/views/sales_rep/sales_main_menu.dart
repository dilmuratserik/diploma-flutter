import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:mobile/views/authorization/signin_page.dart';
import 'package:mobile/views/delivery/history_tab/delivery_history_page.dart';
import 'package:mobile/views/delivery/order_tab/delivery_sales_order_page.dart';
import 'package:mobile/views/delivery/points_tab/delivery_points_page.dart';
import 'package:mobile/views/map_page.dart';
import 'package:mobile/views/sales_rep/points_tab/points_main_page.dart';
import 'package:mobile/views/sales_rep/settings/settings_page.dart';
import 'package:mobile/views/sales_rep/visits_tab/visits_main_page.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page/sales_home_page.dart';
import 'list_of_payments_page.dart/list_of_payments_page.dart';
import 'order_page/sales_order_page.dart';

class SalesMainMenuPage extends StatefulWidget {
  const SalesMainMenuPage({Key? key, required this.role}) : super(key: key);
  final int role;

  @override
  _SalesMainMenuPageState createState() => _SalesMainMenuPageState();
}

class _SalesMainMenuPageState extends State<SalesMainMenuPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetCourier = [
    SalesHomePage(),
    DeliverySalesOrderPage(),
    DeliveryOrderHistoryPage(),
    DeliveryPointsMainPage(),
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

  static const List<String> _salesPageNames = <String>[
    "Главная",
    'Заказы',
    'Визиты',
    'Точки',
  ];

  static const List<String> _courierPageNames = <String>[
    "Главная",
    'Заказы',
    'История',
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
        widget.role == 3
            ? _salesPageNames[_selectedIndex]
            : _courierPageNames[_selectedIndex],
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
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(),
            // child: searchBar.getSearchAction(context)
          ),
        ),
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
      body: widget.role == 3
          ? _widgetSales.elementAt(_selectedIndex)
          : _widgetCourier.elementAt(_selectedIndex),
      drawer: widget.role == 3 ? getSalesDrawer() : getCourierDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: widget.role == 3 ? _salesPageNames[0] : _courierPageNames[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: widget.role == 3 ? _salesPageNames[1] : _courierPageNames[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: widget.role == 3 ? _salesPageNames[2] : _courierPageNames[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: widget.role == 3 ? _salesPageNames[3] : _courierPageNames[3],
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
            title: const Text(
              "Список оплат",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListOfPaymentsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text("Настройки", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text("Выйти", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Alert(
                context: context,
                type: AlertType.warning,
                title: "Внимание",
                desc: "Вы точно хотите выйти?",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Да",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async{
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()),
                              (Route<dynamic> route) => false);
                      AppConstants.isSignIn = false;
                      SharedPreferences prefs =await SharedPreferences.getInstance();
                      prefs.clear();
                    },
                    color: Colors.red,
                  ),
                  DialogButton(
                    child: Text(
                      "Нет",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.grey,
                  ),
                ],
              ).show();
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
            title: const Text(
              "Список оплат",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListOfPaymentsPage()));
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.my_location),
            title: const Text("Карта объектов", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text("Настройки", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text("Выйти", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Alert(
                context: context,
                type: AlertType.warning,
                title: "Внимание",
                desc: "Вы точно хотите выйти?",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Да",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async  {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()),
                              (Route<dynamic> route) => false);
                      AppConstants.isSignIn = false;
                      SharedPreferences prefs =await SharedPreferences.getInstance();
                      prefs.clear();
                    },
                    color: Colors.red,
                  ),
                  DialogButton(
                    child: Text(
                      "Нет",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.grey,
                  ),
                ],
              ).show();
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
