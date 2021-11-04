import 'dart:ui';
import 'package:mobile/views/utills/hex_color.dart';

class AppColors {
  static final Color green = HexColor.fromHex("#196643");
  static final Color gold = HexColor.fromHex("#DDAB40");
  static final Color presentationGray = HexColor.fromHex("#767785");
  static final Color editTextBorderColor = HexColor.fromHex("#DADADA");

  static final Color lightGreen = HexColor.fromHex("#DCFDD4");
  static final Color lightRed = HexColor.fromHex("#FDD4D4");
  static final Color lightOrange = HexColor.fromHex("#FEC400");

  static final Color lightGray = HexColor.fromHex("#EEF3F1");
}

class AppConstants {
  static final String baseUrl = "http://137.184.52.236/";

  static final String phone = "phone";

  static bool isSignIn = false;
}
