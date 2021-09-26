import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/address_item.dart';
import 'package:mobile/components/card_item.dart';
import 'package:mobile/views/utills/const.dart';

class CardsPage extends StatefulWidget {
  // CardsPage(this.product);
  // final Product product;

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {

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
          title: Text('Привязанные карты', style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: Container(
          child: ListView.separated(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: CardItem()
                );
              },
              separatorBuilder: (context, index){
                return Divider();
              }
            )
          ),
        )
    );
  }
}