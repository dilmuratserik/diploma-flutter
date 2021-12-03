import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

class TechSupportPage extends StatefulWidget {
  const TechSupportPage({Key? key}) : super(key: key);

  @override
  _TechSupportPageState createState() => _TechSupportPageState();
}

class _TechSupportPageState extends State<TechSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Написать техподдержку',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 100,
              decoration: InputDecoration(
                hintText : "Кратко объясните, что произошло или перестало работать"
              ),
            ),
            getButton("Отправить")
            
          ],
        ),
      )
    );
  }
  Widget getButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, ),
      child: ElevatedButton(
        onPressed: () {
         
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
