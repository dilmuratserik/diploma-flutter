import 'package:flutter/material.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/categories/about_product.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final String categoryTitle;

  const ProductItem(this.product, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AboutProductPage(product, categoryTitle)));
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90.0,
                      height: 90.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(product.image),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: Container(
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name,
                                    style: TextStyle(fontSize: 18),
                                    overflow: TextOverflow.fade),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(product.description,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                      overflow: TextOverflow.fade),
                                ),
                                Text(
                                  product.price.toString() + ' тг',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ]),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (!AppConstants.basketIDs.contains(product.id)) {
                        Map<String, dynamic> order = {};
                        order['product'] = product.toJson();
                        order['count'] = 1;
                        AppConstants.basket.add(order);
                        AppConstants.basketIDs.add(product.id);
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Успешно",
                          desc: "Продукт успешно добавлен!",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Ок",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                          ],
                        ).show();
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Извините",
                          desc: "Продукт уже в корзине!",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Понятно",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                          ],
                        ).show();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.green,
                        padding: EdgeInsets.only(left: 18, right: 18),
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        )),
                    icon: Icon(Icons.shopping_cart_outlined, size: 18),
                    label: Text(
                      "В КОРЗИНУ",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
