import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/main_menu.dart';
import 'package:mobile/views/authorization/registrationSecond_page.dart';
import 'package:mobile/views/authorization/setPassword_page.dart';
import 'package:mobile/views/authorization/signin_page.dart';
import 'package:mobile/views/home/home_page.dart';
import 'package:mobile/views/authorization/presentation_view_pager.dart';
import 'package:mobile/views/sales_rep/sales_main_menu.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/authorization/verification_page.dart';
import 'package:flutter_paybox/paybox.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var _roleIndex = 1;

  List<Widget> routes = [
    MainMenuPage(),
    SalesMainMenuPage(role: 3),
  ];

  Map<int, Color> color = {
    50: Color.fromRGBO(147, 205, 72, .1),
    100: Color.fromRGBO(147, 205, 72, .2),
    200: Color.fromRGBO(147, 205, 72, .3),
    300: Color.fromRGBO(147, 205, 72, .4),
    400: Color.fromRGBO(147, 205, 72, .5),
    500: Color.fromRGBO(147, 205, 72, .6),
    600: Color.fromRGBO(147, 205, 72, .7),
    700: Color.fromRGBO(147, 205, 72, .8),
    800: Color.fromRGBO(147, 205, 72, .9),
    900: Color.fromRGBO(147, 205, 72, 1),
  };

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(AppColors.green.hashCode, color);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: colorCustom,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        home: AppConstants.isSignIn ? MainMenuPage() : SignInPage());
    // home: MyHomePage());
  }
}
