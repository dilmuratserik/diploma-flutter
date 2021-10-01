import 'package:flutter/material.dart';
import 'package:mobile/models/order_model.dart';
import 'package:mobile/views/profile/order_info_page.dart';

class OrderItem extends StatefulWidget {
  OrderItem(this.order);
  final Order order;

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderInfoPage(widget.order)));
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('Заказ №' + widget.order.id, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      Spacer(),
                      Text(widget.order.price + ' тг', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(widget.order.date + ' - ' + widget.order.status, style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}