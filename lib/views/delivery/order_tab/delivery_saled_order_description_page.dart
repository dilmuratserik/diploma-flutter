import 'package:flutter/material.dart';
import 'package:mobile/models/order_sales_rep_model.dart';
import 'package:mobile/services/courier_api_provider.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DeliverySalesOrderDescriptionPage extends StatefulWidget {
  const DeliverySalesOrderDescriptionPage({Key? key, required this.order})
      : super(key: key);
  final OrderSalesRep order;

  @override
  State<DeliverySalesOrderDescriptionPage> createState() =>
      _DeliverySalesOrderDescriptionPageState();
}

class _DeliverySalesOrderDescriptionPageState
    extends State<DeliverySalesOrderDescriptionPage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  Object? _value = 1;

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
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Заказы',
                style: TextStyle(color: Colors.black, fontSize: 18)),
             automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            bottomOpacity: 1,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              TextButton(
                  onPressed: () {
                    if (firstController.text != '') {
                      saveOrder();
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Извините",
                        desc: "Заполните все поля!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ок",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.red,
                          ),
                        ],
                      ).show();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('Сохранить',
                        style: TextStyle(color: AppColors.green, fontSize: 14)),
                  ))
            ]),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text("Заказ  №" + widget.order.id.toString(),
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.order.date +
                                (widget.order.status == 1
                                    ? " - новый"
                                    : widget.order.status == 2
                                        ? " - в обработке"
                                        : " - доставлен"),
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Торговая точка",
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.order.counterpartyName,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        getDivider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Статус",
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: SizedBox(
                            height: 50,
                            child: InputDecorator(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                isEmpty: false,
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text('Доставка'),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Возврат'),
                                            value: 2,
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        },
                                        hint: Text("Торговая точка")))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Дата доставки",
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                            child: TextFormField(
                              readOnly: true,
                              controller: firstController,
                              cursorColor: Colors.black,
                              enableSuggestions: false,
                              autocorrect: false,
                              maxLength: 30,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () async {
                                    final DateTime? newDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2020, 11, 17),
                                      firstDate: DateTime(2017, 1),
                                      lastDate: DateTime(2022, 7),
                                      helpText: 'Выберите дату',
                                    );
                                    firstController.text =
                                        newDate.toString().substring(0, 10);
                                  },
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                    color: firstFocusNode.hasFocus
                                        ? AppColors.gold
                                        : Colors.grey),
                                focusColor: Colors.grey,
                                fillColor: Colors.grey,
                                counterText: "",
                                // labelText: "Дата заказа",
                                // enabledBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(5),
                                //     borderSide: BorderSide(
                                //         color: Colors.grey, width: 1)),
                                // focusedBorder: OutlineInputBorder(
                                //     borderSide: BorderSide(
                                //         color: AppColors.gold, width: 1))
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Заполните это поле';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Сумма",
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            widget.order.total.toString() + " ₸",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        getDivider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Комментарии",
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                            child: TextFormField(
                              controller: secondController,
                              cursorColor: Colors.black,
                              enableSuggestions: false,
                              autocorrect: false,
                              maxLength: 30,
                              focusNode: secondFocusNode,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: secondFocusNode.hasFocus
                                        ? AppColors.gold
                                        : Colors.grey),
                                focusColor: Colors.grey,
                                fillColor: Colors.grey,
                                counterText: "",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Заполните это поле';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Содержание заказа",
                            style: TextStyle(
                                color: AppColors.presentationGray,
                                fontSize: 16),
                          ),
                        ),
                        for (var i in widget.order.productOrder)
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text(
                                  i['count'].toString() +
                                      'x ' +
                                      i['product']['name'].toString(),
                                  style: TextStyle(fontSize: 18),
                                  maxLines: 5,
                                  softWrap: true,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                      (i['product']['price'] * i['count'])
                                              .toString() +
                                          ' ₸',
                                      style: TextStyle(fontSize: 18)),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

  void saveOrder() async {
    var response = await CourierProvider().saveOrder(widget.order.id,
        secondController.text, 2 + int.parse(_value.toString()));
    if (response['status'] == 'ok') {
      Navigator.pop(context);
    }
  }
}
