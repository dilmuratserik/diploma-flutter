import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';

class CheckoutPage extends StatefulWidget {
  // CheckoutPage(this.product);
  // final Product product;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  Object? _value = 1;
  bool _switchValue1 = false;
  TextEditingController commentController = TextEditingController();
  FocusNode commentFocusNode = FocusNode();

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
          title: Text('Оформления', style: TextStyle(color: Colors.black, fontSize: 18)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight:Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(color: HexColor.fromHex('EEF3F1')),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
                          child: Text('Номер заказа', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5, right: 20),
                          child: Text('№12312312', style: TextStyle(fontSize: 20, color: AppColors.green, fontWeight: FontWeight.w600)),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20, bottom: 5),
                        child: Text('Содержание заказа', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 120, minHeight: 60),
                          child: ListView.builder(itemCount: 2,
                            itemBuilder: (BuildContext context, int index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Text('1x Коса копченная, Золото колчака', style: TextStyle(fontSize: 18))
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Text('500 ₸', style: TextStyle(fontSize: 18)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 6, bottom: 30),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text('Итог:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                            child: Text('3000 ₸', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ]),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
                  child: Text('Способ доставки', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 60,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: false,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("First Item"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 2,
                              )
                          ],
                          onChanged: (value){
                            setState((){
                              _value = value;
                            });
                          },
                          hint:Text("Select item")
                        )
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, bottom: 5),
                  child: Text('Способ доставки', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 60,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: false,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("First Item"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 2,
                              )
                          ],
                          onChanged: (value){
                            setState((){
                              _value = value;
                            });
                          },
                          hint:Text("Select item")
                        )
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Text('Бонусы: 24 тг', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Использовать бонусы",
                        style: TextStyle(fontSize: 16),
                      ),
                      Switch(
                        value: _switchValue1,
                        activeColor: AppColors.gold,
                        onChanged: (value) {
                          setState(() {
                            _switchValue1 = value;
                          });
                          print("value ${value}");
                        }
                      )
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Text('Дополнительные комментарии', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Container(
                    child: TextFormField(
                      onTap: (){},
                      focusNode: commentFocusNode,
                      controller: commentController,
                      cursorColor: Colors.black,
                      maxLength: 30,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: commentFocusNode.hasFocus ? AppColors.gold : Colors.grey),
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
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Заполните это поле';
                      //   }
                      //   return null;
                      // },
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical:0),
                  child: Center(child: getButton('ОПЛАТИТЬ 3000 ₸')),
                ),
            ]),
          ),
        ),
        )
    );
  }
}