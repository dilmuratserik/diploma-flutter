import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:encrypt/encrypt.dart' as encryption;
import 'package:shared_preferences/shared_preferences.dart';

class LockPage extends StatefulWidget {

  // final bool isChangeCode;
  const LockPage({Key? key}) : super(key: key);

  @override
  _LockPageState createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {

  List<int> code = [-1,-1,-1,-1];
  List<int> sCode = [-1,-1,-1,-1];

  var currentIndex = -1;
  var isSecond = false;

  List<Color> borderColors = [AppColors.presentationGray,AppColors.presentationGray,AppColors.presentationGray,AppColors.presentationGray];
  List<Color> fillColors = [Colors.white,Colors.white,Colors.white,Colors.white,];
  List<Color> sBorderColors = [AppColors.presentationGray,AppColors.presentationGray,AppColors.presentationGray,AppColors.presentationGray];
  List<Color> sFillColors = [Colors.white,Colors.white,Colors.white,Colors.white,];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text( "Код быстрого доступа",
              style: TextStyle(color: Colors.black, fontSize: 18)),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: fillColors[0],
                          border: Border.all(color: borderColors[0])
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      color: fillColors[1],
                          border: Border.all(color: borderColors[1])
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: fillColors[2],
                          border: Border.all(color: borderColors[2])
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: fillColors[3],
                          border: Border.all(color: borderColors[3])
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(top:0.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sFillColors[0],
                        border: Border.all(color: sBorderColors[0])
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sFillColors[1],
                        border: Border.all(color: sBorderColors[1])
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sFillColors[2],
                        border: Border.all(color: sBorderColors[2])
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sFillColors[3],
                        border: Border.all(color: sBorderColors[3])
                    ),
                  ),
                ),
              ]),
            ),
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
                              borderColors[currentIndex] = AppColors.presentationGray;
                              fillColors[currentIndex]= Colors.white;
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

  void changeCode() {}

  void checkCodes() {}

  void decrypt() {}

  void encrypt() {
    final plainText = (code[0]-code[1]+code[2]+code[3]).toString();
    final key = encryption.Key.fromUtf8('my 32 length key................');
    final iv = encryption.IV.fromLength(16);

    final encrypter = encryption.Encrypter(encryption.AES(key));


    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.base64);
    saveCode(encrypted.base64);
  }

  void saveCode(String code) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppConstants.lockCode, code);
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
                fillColors[currentIndex] = AppColors.yellow;
                borderColors[currentIndex] = AppColors.yellow;
              });
            }

          if (currentIndex == 3) {
            if (!isSecond){
              currentIndex = -1;
              resetColors();
            }
            // if (!isChangeCode) {
            //   encrypt();
            // }
            // print("asd");
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
  void resetColors() {
    fillColors.replaceRange(0,code.length, [Colors.white]);
    borderColors.replaceRange(0,code.length, [AppColors.presentationGray]);

  }
}
