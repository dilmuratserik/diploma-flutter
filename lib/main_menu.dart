import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/services/profile_api_provider.dart';
import 'package:mobile/views/basket/basket_page.dart';
import 'package:mobile/views/categories/categories_page.dart';
import 'package:mobile/views/home/home_page.dart';
import 'package:mobile/views/home/search_page.dart';
import 'package:mobile/views/profile/profile_page.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart' as mySearchBar;

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoriesPage(isSalesRep: false),
    BasketPage(),
    ProfilePage()
  ];

  static const List<String> _pageNames = <String>[
    "Главная",
    'Категории',
    'Корзина',
    'Профиль',
  ];

  String name = 'Name';
  String phone = '77____________';

  @override
  void initState() {
    getProfileInfo();
    super.initState();
  }

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
      int role = response["role"];
      prefs.setInt('role', role);
      if (role == 2) {
        prefs.setString("bin_iin", response["bin_iin"].toString());
      }
      setState(() {
        name = response['name'];
        phone = response['phone'];
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late mySearchBar.SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        _pageNames[_selectedIndex],
        style: TextStyle(color: AppColors.green),
      ),
      // leading: GestureDetector(
      //     onTap: () {
      //       _key.currentState!.openDrawer();
      //     },
      //     child: Icon(
      //       Icons.menu,
      //       color: Colors.black45,
      //     )),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child:
                _selectedIndex == 0 ? searchBar.getSearchAction(context) : null,
          ),
        ),
      ],
    );
  }

  _MainMenuPageState() {
    searchBar = new mySearchBar.SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: onSubmitted,
        buildDefaultAppBar: buildAppBar,
        onCleared: () {
          // print("cleared");
        },
        onClosed: () {
          // print("closed");
        });
  }

  void onSubmitted(String value) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchPage(value)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: searchBar.build(context),
      body: _widgetOptions.elementAt(_selectedIndex),

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
