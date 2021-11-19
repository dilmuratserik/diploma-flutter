import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/basket_order_model.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlansProvider {
  String API_URL = AppConstants.baseUrl;

  Future<Map<String, dynamic>> getPlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await http
        .get(Uri.parse(API_URL + 'order/plan/'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': "Token $token"
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));
      Map<String, dynamic> result = {'status': 'ok', 'data': data};
      return result;
    } else {
      return {'status': 'Error'};
    }
  }
}
