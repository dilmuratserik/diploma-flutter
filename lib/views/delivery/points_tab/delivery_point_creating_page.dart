import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';

class DeliveryPointCreatingPage extends StatefulWidget {
  const DeliveryPointCreatingPage({Key? key}) : super(key: key);

  @override
  _DeliveryPointCreatingPageState createState() => _DeliveryPointCreatingPageState();
}

class _DeliveryPointCreatingPageState extends State<DeliveryPointCreatingPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  FocusNode focusNode7 = FocusNode();
  FocusNode focusNode8 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Точки',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        bottomOpacity: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode1,
                            controller: controller1,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode1.hasFocus ? AppColors.gold : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Код организации",
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode2,
                            controller: controller2,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode2.hasFocus ? AppColors.gold : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Название организации",
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode3,
                            controller: controller3,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode3.hasFocus ? AppColors.gold : Colors.grey),
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
                                return 'Заполните это поле';
                              }
                              return null;
                            },
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode4,
                            controller: controller4,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode4.hasFocus ? AppColors.gold : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Email",
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode5,
                            controller: controller5,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode5.hasFocus ? AppColors.gold : Colors.grey),
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode6,
                            controller: controller6,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode6.hasFocus ? AppColors.gold : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "БИН/ИИН организации",
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode7,
                            controller: controller7,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode7.hasFocus ? AppColors.gold : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Категория",
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: TextFormField(
                            onTap: (){},
                            focusNode: focusNode8,
                            controller: controller8,
                            cursorColor: Colors.black,
                            maxLength: 30,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: focusNode8.hasFocus ? AppColors.gold : Colors.grey),
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              counterText: "",
                              labelText: "Комментарий",
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
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: getButton('ДОБАВИТЬ ТОЧКУ'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}