import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/Address.dart';
import 'package:mobile/services/profile_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile/views/utills/utill.dart' as utill;
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddNewAddressPage extends StatefulWidget {

   AddNewAddressPage({Key? key, required this.address, required this.onChanged}) : super(key: key);
  final Function onChanged;
  final Address? address;

  @override
  _AddNewAddressPageState createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();

  GlobalKey<FormState> _globalKey = GlobalKey();
  late String _selectedCity;

  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.address != null) {
      firstController.text = widget.address!.street;
      secondController.text = widget.address!.house;
      thirdController.text = widget.address!.apartment;
      fourthController.text = widget.address!.floor.toString();
      fifthController.text = widget.address!.entrance.toString();
    }
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
              title: Text('Новый адрес',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              bottomOpacity: 1,
              iconTheme: IconThemeData(color: Colors.black)),
          body: Form(
            key: _globalKey,
            child: Container(

              child: Column(children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    children: <Widget>[
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: this.firstController,
                          onTap: () {
                            firstFocusNode.requestFocus();
                            secondFocusNode.unfocus();
                            thirdFocusNode.unfocus();
                            fourthFocusNode.unfocus();
                            fifthFocusNode.unfocus();
                            setState(() {});
                          },
                          focusNode: firstFocusNode,
                          cursorColor: Colors.black,
                          maxLength: 30,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: firstFocusNode.hasFocus
                                      ? AppColors.gold
                                      : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Улица",
                              focusedErrorBorder: utill.errorBorder,
                              errorBorder: utill.errorBorder,
                              enabledBorder: utill.enabledBorder,
                              focusedBorder: utill.enabledBorder),
                        ),
                        suggestionsCallback: (pattern) {
                          List<String> list = [];
                          for (var i in suggestions) {
                            if (i.contains(pattern)) {
                              list.add(i);
                            }
                          }
                          return list;
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.toString()),
                          );
                        },
                        transitionBuilder: (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          print(suggestion);
                          this.firstController.text = suggestion.toString();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Заполните это поле';
                          }
                        },
                        onSaved: (value) => this._selectedCity = value!,
                        noItemsFoundBuilder: (BuildContext context) {
                          return Text("");
                        },
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                //   child: Container(
                //     child: TextFormField(
                //       onTap: () {
                //         firstFocusNode.requestFocus();
                //         secondFocusNode.unfocus();
                //         thirdFocusNode.unfocus();
                //         fourthFocusNode.unfocus();
                //         fifthFocusNode.unfocus();
                //         setState(() {});
                //       },
                //       focusNode: firstFocusNode,
                //       controller: firstController,
                //       cursorColor: Colors.black,
                //       maxLength: 30,
                //       decoration: InputDecoration(
                //           labelStyle: TextStyle(
                //               color: firstFocusNode.hasFocus
                //                   ? AppColors.gold
                //                   : Colors.grey),
                //           focusColor: Colors.grey,
                //           fillColor: Colors.grey,
                //           counterText: "",
                //           labelText: "Улица",
                //           focusedErrorBorder: utill.errorBorder,
                //           errorBorder: utill.errorBorder,
                //           enabledBorder: utill.enabledBorder,
                //           focusedBorder: utill.enabledBorder),
                //       validator: (value) {
                //         if (value!.isEmpty) {
                //           return 'Заполните это поле';
                //         }
                //         return null;
                //       },
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Container(
                    child: TextFormField(
                      onTap: () {
                        firstFocusNode.unfocus();
                        secondFocusNode.requestFocus();
                        thirdFocusNode.unfocus();
                        fourthFocusNode.unfocus();
                        fifthFocusNode.unfocus();
                        setState(() {});
                      },
                      focusNode: secondFocusNode,
                      controller: secondController,
                      cursorColor: Colors.black,
                      maxLength: 30,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: secondFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "Дом",
                          focusedErrorBorder: utill.errorBorder,
                          errorBorder: utill.errorBorder,
                          enabledBorder: utill.enabledBorder,
                          focusedBorder: utill.enabledBorder),
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
                        firstFocusNode.unfocus();
                        secondFocusNode.unfocus();
                        thirdFocusNode.requestFocus();
                        fourthFocusNode.unfocus();
                        fifthFocusNode.unfocus();
                        setState(() {});
                      },
                      focusNode: thirdFocusNode,
                      controller: thirdController,
                      cursorColor: Colors.black,
                      maxLength: 30,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: thirdFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "Квартира",
                          focusedErrorBorder: utill.errorBorder,
                          errorBorder: utill.errorBorder,
                          enabledBorder: utill.enabledBorder,
                          focusedBorder: utill.enabledBorder),
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
                        firstFocusNode.unfocus();
                        secondFocusNode.unfocus();
                        thirdFocusNode.unfocus();
                        fourthFocusNode.requestFocus();
                        fifthFocusNode.unfocus();
                        setState(() {});
                      },
                      focusNode: fourthFocusNode,
                      controller: fourthController,
                      cursorColor: Colors.black,
                      maxLength: 30,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: fourthFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "Этаж",
                          focusedErrorBorder: utill.errorBorder,
                          errorBorder: utill.errorBorder,
                          enabledBorder: utill.enabledBorder,
                          focusedBorder: utill.enabledBorder),
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
                        firstFocusNode.unfocus();
                        secondFocusNode.unfocus();
                        thirdFocusNode.unfocus();
                        fourthFocusNode.unfocus();
                        fifthFocusNode.requestFocus();
                        setState(() {});
                      },
                      focusNode: fifthFocusNode,
                      controller: fifthController,
                      cursorColor: Colors.black,
                      maxLength: 30,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: fifthFocusNode.hasFocus
                                  ? AppColors.gold
                                  : Colors.grey),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          counterText: "",
                          labelText: "Подъезд",
                          focusedErrorBorder: utill.errorBorder,
                          errorBorder: utill.errorBorder,
                          enabledBorder: utill.enabledBorder,
                          focusedBorder: utill.enabledBorder),
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
                Visibility(
                  visible: widget.address != null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: getButton('УДАЛИТЬ', () {
                      deleteAddress(widget.address!.id);
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  child: widget.address == null
                      ? getButton('СОХРАНИТЬ', () {
                          if (_globalKey.currentState!.validate()) {
                            addNewAddress(
                                firstController.text,
                                secondController.text,
                                int.parse(thirdController.text),
                                int.parse(fourthController.text),
                                int.parse(fifthController.text));
                          }
                        })
                      : getButton("ИЗМЕНИТЬ", () {
                    if (_globalKey.currentState!.validate()) {
                      changeAddress(
                          widget.address!.id,
                          firstController.text,
                          int.parse(secondController.text),
                          int.parse(thirdController.text),
                          int.parse(fourthController.text),
                          int.parse(fifthController.text));
                    }
                  }),
                ),
              ]),
            ),
          ),
        ));
  }

  void deleteAddress(int id) async {
    Map<String, dynamic> response = await ProfileProvider().deleteAddress(id);
    if (response['status'] != 'Error' || response['status'] != "error") {
      print("resposnse " + response.toString());
      final snackBar = SnackBar(content: Text('Удалено'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else {
      final snackBar = SnackBar(
          content:
              Text('Проверьте соединение с интернетом, или повторите позже!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void addNewAddress(
      String street, String house, int floor, int apartment, int entrance) async {
    Map<String, dynamic> response = await ProfileProvider()
        .addNewAddress(street, house, floor, apartment, entrance);

    if (response[' '] != 'Error') {
      print("resposnse " + response.toString());
      final snackBar = SnackBar(content: Text('Данные изменены'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      widget.onChanged();

    } else {
      final snackBar = SnackBar(
          content:
              Text('Проверьте соединение с интернетом, или повторите позже!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void changeAddress(
      int id,
      String street, int house, int floor, int apartment, int entrance) async {
    String response = await ProfileProvider().changeAddress(
        id, street, house, floor, apartment, entrance);

    if (response != 'Error') {
      print("resposnse " + response.toString());
      final snackBar = SnackBar(content: Text('Данные изменены'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
          content:
              Text('Проверьте соединение с интернетом, или повторите позже!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget getButton(String text, Function f) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          f();
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
