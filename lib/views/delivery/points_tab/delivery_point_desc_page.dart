import 'package:flutter/material.dart';
import 'package:mobile/components/buttonGreen.dart';
import 'package:mobile/models/point_model.dart';
import 'package:mobile/views/utills/const.dart';

class DeliveryPointDescriptionPage extends StatefulWidget {
  const DeliveryPointDescriptionPage({Key? key, required this.point})
      : super(key: key);
  final Point point;

  @override
  _DeliveryPointDescriptionPageState createState() =>
      _DeliveryPointDescriptionPageState();
}

class _DeliveryPointDescriptionPageState
    extends State<DeliveryPointDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:
            Text('Точки', style: TextStyle(color: Colors.black, fontSize: 18)),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        bottomOpacity: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
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
                        child: Text("Код " + widget.point.id.toString(),
                            style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Название организации",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.point.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "БИН/ИИН организации",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.point.binIin,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Номер телефона",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "+" + widget.point.phone,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Кредитный статус",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.point.credit.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Категория",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          (widget.point.orderSector == 1
                              ? "Пивнушка"
                              : widget.point.orderSector == 2
                                  ? "Магазин"
                                  : "Супермаркет"),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Долг",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.point.debt.toString() + " ₸",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                    ],
                  ),
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
}
