import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/authorization/signin_page.dart';
import 'package:mobile/views/profile/change_password_page.dart';
import 'package:mobile/views/profile/personal_data.dart';
import 'package:mobile/views/utills/const.dart';

import 'addresses_page.dart';
import 'cards_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;

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
                CircleAvatar(
                  minRadius: MediaQuery.of(context).size.width / 11,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw9H5v50zD7IWdXEkTt7uwNHPEqgM_U0yWjA&usqp=CAU"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ИП Галлеон",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDataPage()));
              },
              child: getMenuText("Личные данные")
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddressesPage()));
              }, 
              child: getMenuText("Адреса")
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardsPage()));
              }, child: getMenuText("Привязанные карты")
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Данные о местоположении",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: _switchValue1,
                        activeColor: AppColors.gold,
                        onChanged: (value) {
                          setState(() {
                            _switchValue1 = value;
                          });
                          print("value ${value}");
                        })
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Уведомление",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: _switchValue2,
                        activeColor: AppColors.gold,
                        onChanged: (value) {
                          setState(() {
                            _switchValue2 = value;
                          });
                          print("value ${value}");
                        })
                  ]),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));

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
            InkWell(onTap: () {}, child: getMenuText("Заказы")),
            getDivider(10),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: getTitleText("Основная информация"),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top:10),
                child: getMenuText("О нас"),
              ),
            ),
            InkWell(
                onTap: () {},
                child: getMenuText("Контакты")),
            InkWell(
                onTap: () {},
                child: getMenuText("О приложении")),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Выйти", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      ),
    );
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
