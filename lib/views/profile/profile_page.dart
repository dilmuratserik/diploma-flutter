  import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/services/profile_api_provider.dart';
import 'package:mobile/views/authorization/signin_page.dart';
import 'package:mobile/views/profile/about_application_page.dart';
import 'package:mobile/views/profile/about_us_page.dart';
import 'package:mobile/views/profile/change_password_page.dart';
import 'package:mobile/views/profile/orders_page.dart';
import 'package:mobile/views/profile/personal_data.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addresses_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  // bool _switchValue1 = false;
  // bool _switchValue2 = false;

  String name = 'Name';
  String ava = "";
  int uid = 0;
  late SharedPreferences prefs;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  void getInfo() async {
    prefs = await SharedPreferences.getInstance();
    uid = prefs.getInt("user_id")!;

    setState(() {
      name = prefs.getString('name')!;
      ava = prefs.getString('ava')!;
      print(ava);
    });
  }

  void getAva() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: new Icon(Icons.photo),
                                title: new Text('Gallery'),
                                onTap: () async {
                                  Navigator.pop(context);

                                  XFile? avatar = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    if (avatar != null) {
                                      ava = avatar.path;
                                      ProfileProvider().changeAvatar(avatar.path);
                                    };
                                  });
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.camera_alt),
                                title: new Text('Camera'),
                                onTap: () async {
                                  Navigator.pop(context);

                                  XFile? avatar = await _picker.pickImage(
                                      source: ImageSource.camera,
                                      imageQuality: 40);
                                  setState(() {
                                    if (avatar != null) {
                                      ava = avatar.path;
                                      ProfileProvider().changeAvatar(avatar.path);
                                    }
                                  });

                                  // List<int> imageBytes =
                                  // File(ava).readAsBytesSync();
                                  // String base64Image = base64Encode(imageBytes);
                                  // changeAvater(base64Image);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: CircleAvatar(
                      minRadius: MediaQuery
                          .of(context)
                          .size
                          .width / 11,
                      backgroundImage: getImage()),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          "Бонусы: 0 тг",
                          style:
                          TextStyle(fontSize: 18, color: AppColors.green),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            getDivider(30),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: getTitleText("Настройки аккаунта"),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalDataPage()));
                },
                child: getMenuText("Личные данные")),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddressesPage()));
                },
                child: getMenuText("Адреса")),
            // InkWell(
            //     onTap: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => CardsPage()));
            //     },
            //     child: getMenuText("Привязанные карты")),
            // Padding(
            //   padding: const EdgeInsets.only(top: 0),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Данные о местоположении",
            //           style: TextStyle(fontSize: 18),
            //         ),
            //         Switch(
            //             value: _switchValue1,
            //             activeColor: AppColors.gold,
            //             onChanged: (value) {
            //               setState(() {
            //                 _switchValue1 = value;
            //               });
            //               print("value ${value}");
            //             })
            //       ]),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 0),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Уведомление",
            //           style: TextStyle(fontSize: 18),
            //         ),
            //         Switch(
            //             value: _switchValue2,
            //             activeColor: AppColors.gold,
            //             onChanged: (value) {
            //               setState(() {
            //                 _switchValue2 = value;
            //               });
            //               print("value ${value}");
            //             })
            //       ]),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Изменить пароль",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 16,
                      ),
                    ]),
              ),
            ),
            getDivider(30),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersPage()));
                },
                child: getMenuText("Заказы")),
            getDivider(10),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: getTitleText("Основная информация"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: getMenuText("О нас"),
              ),
            ),
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(15.0),
                              topRight: const Radius.circular(15.0))),
                      builder: (context) {
                        return Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3.2,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Напишите нам",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/whatsapp.jpg",
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Whatsapp",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/telegram.jpg",
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Telegram",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: getMenuText("Контакты")),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutApplicationPage()));
                },
                child: getMenuText("О приложении")),
            InkWell(
                onTap: () {
                   Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Внимание",
                    desc: "Вы точно хотите выйти?",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Да",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()),
                                  (Route<dynamic> route) => false);
                          AppConstants.isSignIn = false;
                          prefs.clear();

                        },
                        color: Colors.red,
                      ),
                      DialogButton(
                        child: Text(
                          "Нет",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.grey,
                      ),
                    ],
                  ).show();
                },
                child: getMenuText("Выход")),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     padding: const EdgeInsets.symmetric(vertical: 10),
            //     child: Text(
            //       "Выйти",
            //       style: TextStyle(
            //           color: Colors.red,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  getImage() {
    if (ava.startsWith("http")) {
      return NetworkImage(ava);
    } else if (ava.isNotEmpty) {
      var file = FileImage(File(ava));
      return file;
    }
  }

  Widget getTitleText(String title) {
    return Text(
      title,
      style: TextStyle(color: AppColors.presentationGray, fontSize: 18),
    );
  }

  Widget getMenuText(String title) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
        ]));
  }

  Widget getDivider(double mheight) {
    return Divider(
      color: AppColors.presentationGray,
      thickness: 0.1,
      indent: 0,
      endIndent: 0,
      height: mheight,
    );
  }
}
