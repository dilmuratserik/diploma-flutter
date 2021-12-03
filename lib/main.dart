import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/main_menu.dart';
import 'package:mobile/views/authorization/signin_page.dart';
import 'package:mobile/views/sales_rep/sales_main_menu.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  int role = -1;
  if (sharedPreferences.getInt("role") != null) {
    role = sharedPreferences.getInt("role")!;
  }
  runApp(MyApp(role: role,));
}

class MyApp extends StatelessWidget {
  MyApp({ Key? key, this.role =-1}) : super(key: key);

  final int role;

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
    home: role >= 1 ? role > 2 ? SalesMainMenuPage(role: role): MainMenuPage() : SignInPage()
    );
  }
}
