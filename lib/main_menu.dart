import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/views/basket/basket_page.dart';
import 'package:mobile/views/categories/categories_page.dart';
import 'package:mobile/views/home/home_page.dart';
import 'package:mobile/views/profile/profile_page.dart';
import 'package:mobile/views/utills/const.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainMenuPageState extends State<MainMenuPage> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),CategoriesPage(), BasketPage(), ProfilePage()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title:  Text(_pageNames[_selectedIndex]),
        leading: GestureDetector(
            onTap: () {
              print("asd");
            },
            child: Icon(Icons.menu)),
        // actions: [
        //   GestureDetector(
        //     onTap: () {},
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 16),
        //       child: Icon(Icons.search),
        //     ),
        //   ),
        // ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // drawer: Drawer(
      //   // Add a Lis  View to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Item 1'),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Item 2'),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
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
