import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDataPage extends StatefulWidget {
  // PersonalDataPage(this.product);
  // final Product product;

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  TextEditingController fullNameController = TextEditingController();

  // TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController binController = TextEditingController();

  // final _mobileFormatter = NumberTextInputFormatter();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode binFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();

  Object? _value3 = null;
  Object? _value2 = null;

  int role = 1;
  late String name;
  late int country;
  late int city;
  String bin = "";

  List<Map<String, dynamic>> listOfCountries = [];
  List<Map<String, dynamic>> listOfCities = [];

  int countryID = 0;
  int cityID = 0;

  @override
  void initState() {
    createArray().whenComplete(() => setState(() {
          getRole();
        }));
    super.initState();
  }

  void getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getInt("role")!;
       fullNameController.text = prefs.getString("name")!;
      _value3 = listOfCities[(prefs.getInt("city")! - 1)]["id"];
      // _value2 = listOfCountries[0]["id"];
      if (role == 2) {
        binController.text = prefs.getString("bin_iin")!;
      }
    });
  }

  void changeUserInfo(
      String name, String bin, String country, String city, String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.get('user_id')!;

    String role = prefs.getString("role")!;
    print(country);
    print(city);

    // Map<String, dynamic> response =
    // await ProfileProvider().changeUserInfo(ava, name, country, city, role, id.toString());
    //
    // if (response['status'] == 'ok') {
    //   print("response " + response.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Личные данные',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              brightness: Brightness.light,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  child: TextFormField(
                    onTap: () {
                      fullNameFocusNode.requestFocus();
                      numberFocusNode.unfocus();
                      countryFocusNode.unfocus();
                      cityFocusNode.unfocus();
                      setState(() {});
                    },
                    focusNode: fullNameFocusNode,
                    controller: fullNameController,
                    cursorColor: Colors.black,
                    maxLength: 30,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: fullNameFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "ФИО",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.gold, width: 1))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Заполните это поле';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Visibility(
                visible: role == 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                  child: Container(
                    child: TextFormField(
                      onTap: () {
                        fullNameFocusNode.unfocus();
                        binFocusNode.requestFocus();
                        numberFocusNode.unfocus();
                        countryFocusNode.unfocus();
                        cityFocusNode.unfocus();
                        setState(() {});
                      },
                      focusNode: binFocusNode,
                      controller: binController,
                      cursorColor: Colors.black,
                      maxLength: 30,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: binFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "БИН/ИИН организации",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.gold, width: 1))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Заполните это поле';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              //   child: Container(
              //     child: TextFormField(
              //       onTap: () {
              //         fullNameFocusNode.unfocus();
              //         numberFocusNode.requestFocus();
              //         countryFocusNode.unfocus();
              //         cityFocusNode.unfocus();
              //         setState(() {});
              //       },
              //       focusNode: numberFocusNode,
              //       controller: numberController,
              //       cursorColor: Colors.black,
              //       maxLength: 12,
              //       inputFormatters: <TextInputFormatter>[
              //         FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              //         _mobileFormatter,
              //       ],
              //       decoration: InputDecoration(
              //           labelStyle: TextStyle(
              //               color: numberFocusNode.hasFocus
              //                   ? AppColors.gold
              //                   : Colors.grey),
              //           focusColor: Colors.grey,
              //           fillColor: Colors.grey,
              //           counterText: "",
              //           labelText: "Номер телефона",
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(10.0),
              //               borderSide: BorderSide(color: Colors.grey,
              //                   width: 1)
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide: BorderSide(color: AppColors.gold,
              //                   width: 1)
              //           )
              //       ),
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Номер телефона';
              //         } else if (!value.contains('+')) {
              //           return 'Введите корректный номер телефона';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      dropdownColor: Colors.white,
                      hint: new Text("Страна"),
                      value: _value2,
                      items: [
                        for (int i = 0; i < listOfCountries.length; i++)
                          DropdownMenuItem(
                            child: Text(listOfCountries[i]['name']),
                            value: i,
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value2 = value;
                          countryID =
                              listOfCountries[int.parse(value.toString())]
                                  ['id'];
                        });
                      }),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      dropdownColor: Colors.white,
                      hint: new Text("Город"),
                      value: _value3,
                      items: [
                        for (int i = 0; i < listOfCities.length; i++)
                          DropdownMenuItem(
                            child: Text(listOfCities[i]['name']),
                            value: i,
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value3 = value;
                          cityID =
                              listOfCities[int.parse(value.toString())]['id'];
                        });
                      }),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              //   child: Container(
              //     child: TextFormField(
              //       onTap: () {
              //         numberFocusNode.unfocus();
              //         fullNameFocusNode.unfocus();
              //         countryFocusNode.unfocus();
              //         cityFocusNode.requestFocus();
              //         setState(() {});
              //       },
              //       focusNode: cityFocusNode,
              //       controller: cityController,
              //       cursorColor: Colors.black,
              //       maxLength: 30,
              //       decoration: InputDecoration(
              //           labelStyle: TextStyle(color: cityFocusNode.hasFocus
              //               ? AppColors.gold
              //               : Colors.grey),
              //           focusColor: Colors.grey,
              //           fillColor: Colors.grey,
              //           counterText: "",
              //           labelText: "Город",
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(10.0),
              //               borderSide: BorderSide(color: Colors.grey,
              //                   width: 1)
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide: BorderSide(color: AppColors.gold,
              //                   width: 1)
              //           )
              //       ),
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Заполните это поле';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                child: Center(child: getButton('СОХРАНИТЬ')),
              ),
            ]),
          )),
    );
  }

  Future<String> _loadJsonAsset() async {
    return await rootBundle.loadString('assets/json/city.json');
  }

  Future createArray() async {
    String jsonString = await _loadJsonAsset();
    final jsonResponse = json.decode(jsonString);
    for (var i in jsonResponse) {
      if (i['model'] == 'locations.country') {
        listOfCountries.add({'name': i['fields']['name'], 'id': i['pk']});
      } else if (i['model'] == 'locations.city') {
        listOfCities.add({'name': i['fields']['name'], 'id': i['pk']});
      }
    }
  }

  Widget getButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          changeUserInfo(fullNameController.text, binController.text,
              countryController.text, cityController.text, role.toString());
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 30),
            // double.infinity is the width and 30 is the height
            primary: AppColors.green,
            padding: EdgeInsets.symmetric(vertical: 17),
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto")),
        child: Text(text),
      ),
    );
  }
}
