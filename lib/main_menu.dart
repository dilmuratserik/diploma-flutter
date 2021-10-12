import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/views/basket/basket_page.dart';
import 'package:mobile/views/categories/categories_page.dart';
import 'package:mobile/views/home/home_page.dart';
import 'package:mobile/views/profile/profile_page.dart';
import 'package:mobile/views/sales_rep/order_page/sales_order_page.dart';
import 'package:mobile/views/sales_rep/points_tab/points_main_page.dart';
import 'package:mobile/views/sales_rep/home_page/sales_home_page.dart';
import 'package:mobile/views/sales_rep/visits_tab/visits_main_page.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoriesPage(),
    BasketPage(),
    ProfilePage()
  ];

  static const List<String> _pageNames = <String>[
    "Главная",
    'Категории',
    'Корзина',
    'Профиль',
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
            print("asd");
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
            // child: Icon(Icons.search, color: Colors.black,),
            child:
                _selectedIndex == 0 ? searchBar.getSearchAction(context) : null,
          ),
        ),
      ],
      // title: new Text('My Home Page'),
      // actions:
    );
  }

  _MainMenuPageState() {
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
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: _pageNames[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: _pageNames[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: _pageNames[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: _pageNames[3],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.green,
        onTap: _onItemTapped,
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
