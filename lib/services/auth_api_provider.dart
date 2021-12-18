import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  String API_URL = AppConstants.baseUrl;

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final response = await http.post(
      Uri.parse(API_URL + 'users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "phone": phone,
        "password": password,
      }),
    );
    print(phone);
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      print("status code" + response.statusCode.toString());
      print("ololk" +response.body);
      return {'status': 'Error'};
    }
  }

  Future<dynamic> registration(String phone) async {
    final response = await http.post(
      Uri.parse(API_URL + 'users/phone/otp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, dynamic>{
        "phone": phone,
      }),
    );
    print("phone ${phone}");


    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return 'Error';
    }
  }

  Future<String> sendDeviceToken(String deviceToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await http.post(
      Uri.parse(API_URL + 'api/device-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
      body: jsonEncode(<String, dynamic>{
        "device_token": deviceToken,
      }),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Error';
    }
  }

  Future<Map<String, dynamic>> sendVerificationCode(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phone = prefs.getString('phone');

    final response = await http.post(
      Uri.parse(API_URL + 'users/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{"phone": phone, "code": code}),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      print("body" + response.body);
      print("status" + response.statusCode.toString());
      return {'status': 'Error'};
    }
  }

  Future<Map<String, dynamic>> setProfileData(String role, String name,
      String iin, String country, String city, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, dynamic> bodyDic = {
      "password": password,
      "role": role,
      "name": name,
      "country": country,
      "city": city,
    };

    if (role == '2') {
      bodyDic["bin_iin"] = iin;
    }

    final response = await http.post(
      Uri.parse(API_URL + 'users/register/continue/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
      body: jsonEncode(bodyDic),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': 'Error'};
    }
  }
}
