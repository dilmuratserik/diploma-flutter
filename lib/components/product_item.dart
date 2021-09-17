import 'package:flutter/material.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/const.dart';


class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
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
                  new Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:
                              new AssetImage("assets/images/cheese.jpg")))),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                      child: Container(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width / 1.9,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.description.title,
                                  style: TextStyle(fontSize: 18),
                                  overflow: TextOverflow.fade),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 8, bottom: 8),
                                child: Text(product.description.description,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                    overflow: TextOverflow.fade),
                              ),
                              Text(
                                product.description.price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ]),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
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
    );
  }
}