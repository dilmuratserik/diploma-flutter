import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/order_model.dart';
import 'package:mobile/views/utills/const.dart';

class OrderInfoPage extends StatefulWidget {
  OrderInfoPage(this.order);
  final Order order;

  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {

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
          title: Text('Заказ', style: TextStyle(color: Colors.black, fontSize: 18)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        body: SingleChildScrollView(
          child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding( padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text('Заказ №' + widget.order.id, style: TextStyle(color: AppColors.green,fontSize: 22, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(widget.order.date + ' - ' + widget.order.status, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Получатель', style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text('Марат, +7(700) 000-00-00', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Адрес', style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text('Микрорайон Аксай-1, 1к2', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Оплата', style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text('Онлайн, Kaspi.kz', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Доставка', style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text('Через Yandex', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Содержание заказа', style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                ConstrainedBox(
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
                  )),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(child: getButton('ПОВТОРИТЬ')),
                ),
              ]),
        ),
        )
    );
  }
}