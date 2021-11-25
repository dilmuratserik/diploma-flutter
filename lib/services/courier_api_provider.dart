import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourierProvider {
  String API_URL = AppConstants.baseUrl;

  Future<Map<String, dynamic>> saveOrder(
      int id, String comment, int status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(API_URL + 'order/courier/order/change/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "comment": comment,
        "status": status,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(utf8.decode(response.body.codeUnits));
      Map<String, dynamic> result = {'status': 'ok', 'data': data};
      return result;
    } else {
      return {'status': 'Error'};
    }
  }

  Future<Map<String, dynamic>> getHistoryOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(API_URL + 'order/courier/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));
      Map<String, dynamic> result = {'status': 'ok', 'data': data};
      return result;
    } else {
      return {'status': 'Error'};
    }
  }

  Future<Map<String, dynamic>> getOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(API_URL + 'order/api/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));
      Map<String, dynamic> result = {'status': 'ok', 'data': data};
      return result;
    } else {
      return {'status': 'Error'};
    }
  }

  Future<Map<String, dynamic>> getPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(API_URL + 'users/points/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));
      Map<String, dynamic> result = {'status': 'ok', 'data': data};
      return result;
    } else {
      return {'status': 'Error'};
    }
  }
}
