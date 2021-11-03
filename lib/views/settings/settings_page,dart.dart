import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _switchValue1 = false;
  bool _switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_outlined,color: AppColors.presentationGray),
        title: Text("Настройки", style: TextStyle(color: AppColors.green),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getMenuText("О приложении"),
            getMenuText("Инструкция по использованию про.."),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  "Включить уведомление?",
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
            getMenuText("Написать техподдержку"),
            getMenuText("Изменить код быстрого доступа"),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Отключить код быстрого доступа?",
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
          ],
        ),
      ),
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

}
