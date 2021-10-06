import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

class SalesOrderDescriptionPage extends StatelessWidget {
  const SalesOrderDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Заказы',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)),
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
                        child: Text("Заказ  №45565",
                            style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "11 мая 2021 12:00 - доставлен",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Торговая точка",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Бегалиев 5, Морошкин магазин",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Сумма",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          "3 000 ₸",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      getDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Содержание заказа",
                          style: TextStyle(
                              color: AppColors.presentationGray, fontSize: 16),
                        ),
                      ),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
                      getMeaningOrder(
                          "1х Коса копченая, Золото колчака", "500 ₸"),
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

  Widget getMeaningOrder(String text, String price) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            text,
            style: TextStyle(fontSize: 18),
            maxLines: 5,
            softWrap: true,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(price, style: TextStyle(fontSize: 18)),
          )
        ],
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

// Row(
//   children: [
//     Icon(
//       Icons.close,
//       color: AppColors.presentationGray,
//       size: 26,
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 24.0),
//       child: Text(
//         "Подробнее",
//         style: TextStyle(
//             fontWeight: FontWeight.bold, fontSize: 22),
//       ),
//     ),
//   ],
// ),
