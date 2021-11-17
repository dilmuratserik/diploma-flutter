import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/views/sales_rep/order_page/saled_order_description_page.dart';
import 'package:mobile/views/utills/const.dart';

class SalesOrderItem extends StatefulWidget {
  const SalesOrderItem({Key? key, required this.order}) : super(key: key);
  final OrderSalesRep order;

  @override
  _SalesOrderItemState createState() => _SalesOrderItemState();
}

class _SalesOrderItemState extends State<SalesOrderItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SalesOrderDescriptionPage(order: widget.order)));
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Заказ №" + widget.order.id.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Text(
                  'Бегалиев 5, Морошкин магазин',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Row(
                  children: [
                    Text("Сумма:",
                        style: TextStyle(
                            fontSize: 18, color: AppColors.presentationGray)),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text("3 000 ₸", style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: AppColors.presentationGray,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            widget.order.date,
                            style: TextStyle(color: AppColors.presentationGray),
                          ),
                        )
                      ],
                    ),
                    getStateButton(AppColors.lightGreen, "Доставлен")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getDivider() {
    return Divider(
      color: AppColors.presentationGray,
      indent: 1,
      endIndent: 1,
    );
  }

  Widget getStateButton(Color color, String text) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(text));
  }
}
