import 'dart:ui';
import 'package:mobile/models/basket_order_model.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/hex_color.dart';

class AppColors {
  static final Color green = HexColor.fromHex("#196643");
  static final Color gold = HexColor.fromHex("#DDAB40");
  static final Color presentationGray = HexColor.fromHex("#767785");
  static final Color editTextBorderColor = HexColor.fromHex("#DADADA");
  static final Color yellow = HexColor.fromHex("#FF9F1C");

  static final Color lightGreen = HexColor.fromHex("#DCFDD4");
  static final Color lightRed = HexColor.fromHex("#FDD4D4");
  static final Color lightOrange = HexColor.fromHex("#FEC400");

  static final Color lightGray = HexColor.fromHex("#EEF3F1");
}

class AppConstants {
  static final String baseUrl = "http://137.184.52.236/";
  static final String googleAPIKey = 'AIzaSyBVo1JrL14yjH66jF7OyFrm4CENZPW3R-w';
  static String name = 'Name';
  static String phone = '77____________';
  static String ava = '';

  static bool isSignIn = false;
  static bool isHaveLockScreen = false;
  static String lockCode = "lockCode";

  static List<int> basketIDs = [];
  static List<BasketOrder> basket = [];

  static List<int> basketIDsSalesRep = [];
  static List<BasketOrder> basketSalesRep = [];
}
