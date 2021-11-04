import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:encrypt/encrypt.dart' as encryption;

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);

  @override
  _LockPageState createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {

  List<int> code = [-1,-1,-1,-1];
  List<Color> colors = [Colors.black54, Colors.black54, Colors.black54, Colors.black54];
  var currentIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text( "Код быстрого доступа",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Неправильно введен 4-значный пароль",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors[0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:colors[1],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors[2],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors[3],
                  ),
                ),
              ),
            ]),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: RawMaterialButton(
                        onPressed: () {
                          if (currentIndex>=0) {
                            code[currentIndex] = -1;
                            print(code);
                            print(currentIndex);
                            setState(() {
                              colors[currentIndex] = Colors.black54;
                            });
                            currentIndex--;

                          }
                        },
                        elevation: 0,
                        fillColor: AppColors.lightGray,
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Colors.black54,
                        ),
                        padding: EdgeInsets.all(22.0),
                        shape: CircleBorder(),

                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getCircleButton(
    int value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: RawMaterialButton(
        onPressed: () {
          if (currentIndex < 3) {
            currentIndex++;
            code[currentIndex] = value;
            print(code);
            setState(() {
              colors[currentIndex] = Colors.red;
            });
          }
          if (currentIndex == 3) {
            encrypt();
            print("asd");
          }
        },
        elevation: 0,
        fillColor: AppColors.lightGray,
        child: Text(
          value.toString(),
          style: TextStyle(fontSize: 24, color: Colors.black54),
        ),
        padding: EdgeInsets.all(22.0),
        shape: CircleBorder(),
      ),
    );
  }

  void encrypt() {
    final plainText = (code[0]-code[1]+code[2]+code[3]).toString();
    final key = encryption.Key.fromUtf8('my 32 length key................');
    final iv = encryption.IV.fromLength(16);

    final encrypter = encryption.Encrypter(encryption.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.base64);
  }
}
