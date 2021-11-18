import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider {
  String API_URL = AppConstants.baseUrl;

  Future<Map<String, dynamic>> getProfileInfo(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(API_URL + 'users/detail/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
    );

    // print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result =
          jsonDecode(utf8.decode(response.body.codeUnits));
      return result;
    } else {
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

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': 'Error'};
    }
  }

  Future<String> changePassword(String oldPassword, String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print("tokens" + token.toString());

    final response = await http.post(
      Uri.parse(API_URL + 'users/password/change/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
      body: jsonEncode(<String, dynamic>{
        "old_password": oldPassword,
        "new_password": newPassword,
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Error';
    }
  }

  Future<Map<String, dynamic>> changeUserInfo(String name, String bin,
      int country, int city, String role, String user_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, dynamic> bodyDic = {
      "name": name,
      "country": country,
      "city": city,
      "role": role,
    };

    if (role == '2') {
      bodyDic["bin_iin"] = bin;
    }
    print(bodyDic);

    final response = await http.put(
      Uri.parse(API_URL + 'users/detail/' + user_id + "/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Token $token"
      },
      body: jsonEncode(bodyDic),
    );

    print(response);
    print(response.body);
    print("response code" + response.statusCode.toString());

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': 'Error'};
    }
  }
}
