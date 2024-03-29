import 'package:flutter/material.dart';
import 'package:mobile/models/basket_order_model.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/categories/about_product.dart';
import 'package:mobile/views/utills/const.dart';

class BasketProductItem extends StatefulWidget {
  BasketProductItem(this.order, this.categoryTitle);
  // const BasketProductItem({Key? key, required this.product}) : super(key: key);
  BasketOrder order;
  final String categoryTitle;

  @override
  _BasketProductItemState createState() => _BasketProductItemState();
}

class _BasketProductItemState extends State<BasketProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: GestureDetector(
        onTap: () {},
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    widget.order.product.image[0]['image'])))),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: Container(
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.order.product.name,
                                    style: TextStyle(fontSize: 18),
                                    overflow: TextOverflow.fade),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(widget.order.product.description,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                      overflow: TextOverflow.fade),
                                ),
                                Text(
                                  widget.order.product.price.toString() + ' тг',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ]),
                        )),
                    GestureDetector(
                      onTap: () {
                        AppConstants.basket.remove(widget.order);
                        AppConstants.basketIDs.remove(widget.order.product.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child:
                            Icon(Icons.delete_outlined, color: AppColors.gold),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (widget.order.count > 1) {
                                int index =
                                    AppConstants.basket.indexOf(widget.order);
                                widget.order.count = widget.order.count - 1;
                                AppConstants.basket[index] = widget.order;
                              }
                            });
                          },
                          child: Container(
                              width: 45,
                              height: 40,
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.only(
                                  //   topLeft: Radius.circular(1),
                                  // ),
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 1),
                                      left: BorderSide(
                                          color: Colors.grey, width: 1),
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1))),
                              child: Center(
                                child: Text(
                                  "–",
                                  style: TextStyle(
                                      color: AppColors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        )),
                    Container(
                      width: 45,
                      height: 40,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text(widget.order.count.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700))),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              int index =
                                  AppConstants.basket.indexOf(widget.order);
                              widget.order.count = widget.order.count + 1;
                              AppConstants.basket[index] = widget.order;
                            });
                          },
                          child: Container(
                              width: 45,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 1),
                                      right: BorderSide(
                                          color: Colors.grey, width: 1),
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1))),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ))),
                        )),
                  ],
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
