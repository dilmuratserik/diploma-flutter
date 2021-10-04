import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';

class CheckoutPage extends StatefulWidget {
  // CheckoutPage(this.product);
  // final Product product;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

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
        body: Column(
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
            )
        ]),
        )
    );
  }
}