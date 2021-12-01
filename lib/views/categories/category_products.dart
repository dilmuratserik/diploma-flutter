import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/appBar.dart';
import 'package:mobile/components/listTileEntry.dart';
import 'package:mobile/components/product_item.dart';
import 'package:mobile/models/entry_model.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/services/orders_api_provider.dart';

class CategoryProductsPage extends StatefulWidget {
  CategoryProductsPage(
      this.title, this.category, this.subcategory, this.isSalesRep);

  final String title;
  final String category;
  final String subcategory;
  final bool isSalesRep;

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  List<Product> products = [];
  Object? _value = 1;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(widget.title,
                style: TextStyle(color: Colors.black, fontSize: 18)),
            brightness: Brightness.light,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            bottomOpacity: 1,
            iconTheme: IconThemeData(color: Colors.black)),
        body: Column(
          children: [
            Container(
                child: Column(children: [
              Row(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Icon(Icons.sort),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                      dropdownColor: Colors.white,
                      hint: new Text("Сортировка"),
                      value: _value,
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            "Без сортировки",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "По возрастанию цен",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "По убыванию цен",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          value: 3,
                        ),
                        // DropdownMenuItem(
                        //   child: Text(
                        //     "По новинкам",
                        //     style: TextStyle(fontWeight: FontWeight.w500),
                        //   ),
                        //   value: 4,
                        // ),
                        // DropdownMenuItem(
                        //   child: Text(
                        //     "По скидкам",
                        //     style: TextStyle(fontWeight: FontWeight.w500),
                        //   ),
                        //   value: 5,
                        // ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          useSort(int.parse(value.toString()));
                        });
                      }),
                ),
              ]),
              Divider(color: Colors.grey),
              Container(
                height: MediaQuery.of(context).size.height * 0.78,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) => ProductItem(
                      products[index], widget.title, widget.isSalesRep),
                ),
              ),
            ])),
          ],
        ));
  }

  void getProducts() async {
    var response =
        await OrdersProvider().getOrdersByCategory(widget.category.toString());

    if (response['status'] != 'Error') {
      List<Product> prods = [];
      for (var i in response['results']) {
        prods.add(Product.fromJson(i));
      }
      setState(() {
        products = prods;
      });
    }
  }

  void useSort(int sortType) {
    if (sortType == 1) {
      getProducts();
    } else if (sortType == 2) {
      setState(() {
        products.sort((a, b) {
          return a.price.compareTo(b.price);
        });
      });
    } else if (sortType == 3) {
      setState(() {
        products.sort((a, b) {
          return a.price.compareTo(b.price);
        });
        products = products.reversed.toList();
      });
    } else if (sortType == 4) {
      print(sortType);
    } else if (sortType == 5) {
      print(sortType);
    }
  }
}
