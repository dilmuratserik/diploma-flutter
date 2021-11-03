import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);

  @override
  _LockPageState createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_outlined,color: AppColors.presentationGray),
        title: Text("Код быстрого доступа", style: TextStyle(color: AppColors.green),),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Неправильно введен 4-значный пароль",textAlign: TextAlign.center, style: TextStyle(
            fontSize: 18
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
          ]
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCircleButton(1),
                    getCircleButton(2),
                    getCircleButton(3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCircleButton(4),
                    getCircleButton(5),
                    getCircleButton(6),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCircleButton(7),
                    getCircleButton(8),
                    getCircleButton(9),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCircleButton(0),
                    getCircleButton(-1),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget getCircleButton(int value)  {
   return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightGray,
        ),
        child: Center(child: Text(value.toString(), style: TextStyle(fontSize: 24),)),
      ),
    );
  }
}
