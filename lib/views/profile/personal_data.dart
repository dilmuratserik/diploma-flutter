import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/utill.dart';


class PersonalDataPage extends StatefulWidget {
  // PersonalDataPage(this.product);
  // final Product product;

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();

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
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Личные данные', style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: Container(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                child: TextFormField(
                  onTap: (){
                    fullNameFocusNode.requestFocus();
                    numberFocusNode.unfocus();
                    countryFocusNode.unfocus();
                    cityFocusNode.unfocus();
                    setState((){});
                  },
                  focusNode: fullNameFocusNode,
                  controller: fullNameController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: fullNameFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "ФИО",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey, width:1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gold, width:1)
                    )
                  ),
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
                  onTap: (){
                    fullNameFocusNode.unfocus();
                    numberFocusNode.requestFocus();
                    countryFocusNode.unfocus();
                    cityFocusNode.unfocus();
                    setState((){});
                  },
                  focusNode: numberFocusNode,
                  controller: numberController,
                  cursorColor: Colors.black,
                  maxLength: 12,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    _mobileFormatter,
                  ],
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: numberFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "Номер телефона",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey, width:1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gold, width:1)
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Номер телефона';
                    } else if (!value.contains('+')) {
                      return 'Введите корректный номер телефона';
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
                  onTap: (){
                    numberFocusNode.unfocus();
                    fullNameFocusNode.unfocus();
                    countryFocusNode.requestFocus();
                    cityFocusNode.unfocus();
                    setState((){});
                  },
                  focusNode: countryFocusNode,
                  controller: countryController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: countryFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "Страна",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey, width:1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gold, width:1)
                    )
                  ),
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
                  onTap: (){
                    numberFocusNode.unfocus();
                    fullNameFocusNode.unfocus();
                    countryFocusNode.unfocus();
                    cityFocusNode.requestFocus();
                    setState((){});
                  },
                  focusNode: cityFocusNode,
                  controller: cityController,
                  cursorColor: Colors.black,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: cityFocusNode.hasFocus ? AppColors.gold : Colors.grey),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey,
                    counterText: "",
                    labelText: "Город",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey, width:1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gold, width:1)
                    )
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:60),
              child: Center(child: getButton('СОХРАНИТЬ')),
            ),
          ]),
        )
      ),
    );
  }
}