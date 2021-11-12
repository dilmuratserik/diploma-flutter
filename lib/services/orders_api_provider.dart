import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersProvider {
  String API_URL = AppConstants.baseUrl;

  Future<Map<String, dynamic>> getOrdersByCategory(String categoryId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await http.post(
        Uri.parse(API_URL + 'product/?category=' + categoryId),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Token $token"
        });

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': 'Error'};
    }
  }

  Future<Map<String, dynamic>> getOrdersBySearch(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await http.post(
        Uri.parse(API_URL + 'product/?search=' + text),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Token $token"
        });

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': 'Error'};
    }
  }

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

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': 'Error'};
    }
  }
}
