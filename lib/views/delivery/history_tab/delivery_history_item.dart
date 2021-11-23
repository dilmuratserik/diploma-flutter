import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/services/courier_api_provider.dart';
import 'package:mobile/views/delivery/order_tab/delivery_saled_order_description_page.dart';
import 'package:mobile/views/sales_rep/order_page/saled_order_description_page.dart';
import 'package:mobile/views/utills/const.dart';

class DeliveryHistoryItem extends StatefulWidget {
  const DeliveryHistoryItem({Key? key, required this.order}) : super(key: key);
  final OrderSalesRep order;

  @override
  _DeliveryHistoryItemState createState() => _DeliveryHistoryItemState();
}

class _DeliveryHistoryItemState extends State<DeliveryHistoryItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DeliverySalesOrderDescriptionPage(order: widget.order)));
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
                "Заказ №45565",
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
                padding: const EdgeInsets.only(top: 9.0),
                child: Row(
                  children: [
                    Text("Тип оплаты:",
                        style: TextStyle(
                            fontSize: 18, color: AppColors.presentationGray)),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text("Наличные", style: TextStyle(fontSize: 18)),
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
                            "27.09.2021 14:31",
                            style: TextStyle(color: AppColors.presentationGray),
                          ),
                        )
                      ],
                    ),
                    getStateButton(AppColors.lightRed, "Новый")
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
