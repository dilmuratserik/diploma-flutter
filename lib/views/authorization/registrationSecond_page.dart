import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/bitTextOnBottom.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/authorization/setPassword_page.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';
import 'package:mobile/views/utills/utill.dart';
import 'package:mobile/views/authorization/verification_page.dart';

class RegistrationSecondPage extends StatefulWidget {
  const RegistrationSecondPage({Key? key}) : super(key: key);

  @override
  _RegistrationSecondPageState createState() => _RegistrationSecondPageState();
}

class _RegistrationSecondPageState extends State<RegistrationSecondPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nameOfOrganizationController = TextEditingController();
  TextEditingController iinController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode nameOfOrganizationFocusNode = FocusNode();
  FocusNode iinFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();

  Object? _value = 1;

  @override
  void initState() {
    super.initState();
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
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text('Регистрация',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                brightness: Brightness.light,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                bottomOpacity: 1,
                iconTheme: IconThemeData(color: Colors.black)),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text('Регистрация',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Заполните свои данные',
                    style: TextStyle(fontSize: 14)),
              ),
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
                      hint: new Text("Роль"),
                      value: _value,
                      items: const [
                        DropdownMenuItem(
                          child: Text("Физическое лицо"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Организация"),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
              ),
              _value == 1
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Container(
                        child: TextFormField(
                          onTap: () {
                            fullNameFocusNode.requestFocus();
                            nameOfOrganizationFocusNode.unfocus();
                            iinFocusNode.unfocus();
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
                                  borderSide: BorderSide(
                                      color: AppColors.gold, width: 1))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Заполните это поле';
                            }
                            return null;
                          },
                        ),
                      ),
                    )
                  : Container(),
              _value == 2
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Container(
                        child: TextFormField(
                          onTap: () {
                            fullNameFocusNode.unfocus();
                            nameOfOrganizationFocusNode.requestFocus();
                            iinFocusNode.unfocus();
                            countryFocusNode.unfocus();
                            cityFocusNode.unfocus();
                            setState(() {});
                          },
                          focusNode: nameOfOrganizationFocusNode,
                          controller: nameOfOrganizationController,
                          cursorColor: Colors.black,
                          maxLength: 40,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: nameOfOrganizationFocusNode.hasFocus
                                      ? AppColors.gold
                                      : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Название",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.gold, width: 1))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Заполните это поле';
                            }
                            return null;
                          },
                        ),
                      ),
                    )
                  : Container(),
              _value == 2
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: TextFormField(
                          onTap: () {
                            fullNameFocusNode.unfocus();
                            nameOfOrganizationFocusNode.unfocus();
                            iinFocusNode.requestFocus();
                            countryFocusNode.unfocus();
                            cityFocusNode.unfocus();
                            setState(() {});
                          },
                          focusNode: iinFocusNode,
                          controller: iinController,
                          cursorColor: Colors.black,
                          maxLength: 30,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: iinFocusNode.hasFocus
                                      ? AppColors.gold
                                      : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "ИНН/БИН организации",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.gold, width: 1))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Заполните это поле';
                            }
                            return null;
                          },
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  child: TextFormField(
                    onTap: () {
                      fullNameFocusNode.unfocus();
                      nameOfOrganizationFocusNode.unfocus();
                      iinFocusNode.unfocus();
                      countryFocusNode.requestFocus();
                      cityFocusNode.unfocus();
                      setState(() {});
                    },
                    focusNode: countryFocusNode,
                    controller: countryController,
                    cursorColor: Colors.black,
                    maxLength: 30,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: countryFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Страна",
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  child: TextFormField(
                    onTap: () {
                      fullNameFocusNode.unfocus();
                      nameOfOrganizationFocusNode.unfocus();
                      iinFocusNode.unfocus();
                      countryFocusNode.unfocus();
                      cityFocusNode.requestFocus();
                      setState(() {});
                    },
                    focusNode: cityFocusNode,
                    controller: cityController,
                    cursorColor: Colors.black,
                    maxLength: 30,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: cityFocusNode.hasFocus
                                ? AppColors.gold
                                : Colors.grey),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                        counterText: "",
                        labelText: "Город",
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
              Spacer(),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_value == 1 &&
                        fullNameController.text != '' &&
                        countryController.text != '' &&
                        cityController.text != '') {
                      nextPage();
                    } else if (_value == 2 &&
                        nameOfOrganizationController.text != '' &&
                        iinController.text != '' &&
                        countryController.text != '' &&
                        cityController.text != '') {
                      nextPage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Заполните поля.",
                            style: TextStyle(fontSize: 16)),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 30),
                      primary: AppColors.green,
                      padding: EdgeInsets.symmetric(vertical: 17),
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto")),
                  child: Text('ПРОДОЛЖИТЬ РЕГИСТРАЦИЮ'),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 20),
                child: getBitText('У вас есть учетная запись?', 'Войти'),
              )),
            ])));
  }

  void nextPage() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SetPasswordPage(
                  role: _value.toString(),
                  name: _value == 1
                      ? fullNameController.text
                      : nameOfOrganizationController.text,
                  iin: iinController.text,
                  country: countryController.text,
                  city: cityController.text,
                )));
  }
}
