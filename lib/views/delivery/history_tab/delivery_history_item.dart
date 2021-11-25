import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/services/courier_api_provider.dart';
import 'package:mobile/views/delivery/order_tab/delivery_saled_order_description_page.dart';
import 'package:mobile/views/sales_rep/order_page/saled_order_description_page.dart';
import 'package:mobile/views/utills/const.dart';

import 'delivery_history_order_desc_page.dart';

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
                    DeliveryHistoryOrderDescriptionPage(order: widget.order)));
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
                  widget.order.counterpartyName,
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
                      child: Text(widget.order.total.toString() + " ₸",
                          style: TextStyle(fontSize: 18)),
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.53,
                        child: Text(
                            widget.order.paymentType == 1
                                ? 'Наличными'
                                : widget.order.paymentType == 2
                                    ? 'Картой Visa/MasterCard'
                                    : 'Оплата в системе Kaspi.kz',
                            style: TextStyle(fontSize: 18)),
                      ),
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
                    widget.order.status == 1
                        ? getStateButton(
                            AppColors.lightRed, "Новый", Colors.red[900])
                        : widget.order.status == 2
                            ? getStateButton(AppColors.yellow, "В обработке",
                                Colors.yellow[900])
                            : widget.order.status == 3
                                ? getStateButton(AppColors.lightGreen,
                                    "Доставлен", Colors.green[900])
                                : getStateButton(AppColors.lightRed, "Возврат",
                                    Colors.red[900])
                  ],
                ),
              ),
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

  Widget getStateButton(Color color, String text, Color? textColor) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w800)));
  }
}
