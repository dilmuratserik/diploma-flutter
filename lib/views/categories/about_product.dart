import 'package:flutter/material.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/views/utills/const.dart';


class AboutProductPage extends StatefulWidget {
  AboutProductPage(this.product);
  final Product product;

  @override
  _AboutProductPageState createState() => _AboutProductPageState();
}

class _AboutProductPageState extends State<AboutProductPage> {

  int count = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('О товаре', style: TextStyle(color: Colors.black, fontSize: 18)),
        brightness: Brightness.light,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        bottomOpacity: 1,
        iconTheme: IconThemeData(color: Colors.black)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Image.asset(
                'assets/images/cheese.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                widget.product.description.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Text(
                widget.product.description.description,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Text(
                  widget.product.description.price + ' / 100 гр',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        count = count - 1;
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
                          top: BorderSide(color: Colors.grey, width: 1),
                          left: BorderSide(color: Colors.grey, width: 1),
                          bottom: BorderSide(color: Colors.grey, width: 1)
                        )
                      ),
                      child: Center(
                        child: Text(
                          "–",
                          style: TextStyle(color: AppColors.green, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ),
                  )
                ),
                Container(
                  width: 45,
                  height: 40, 
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Center(child: 
                    Text(count.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        count = count + 1;
                      });
                    },
                    child: Container(
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 1),
                          right: BorderSide(color: Colors.grey, width: 1),
                          bottom: BorderSide(color: Colors.grey, width: 1)
                        )
                      ),
                      child: Center(child:
                        Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      )
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                'Описание',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                'Lorem Lorem Lorem Lorem Lorem Lorem Lorem as Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '500 тг',
                          style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '450 тг',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
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
                    ),
                ],
              ),
            )
          ]),
        ),
      )
    );
  }
}