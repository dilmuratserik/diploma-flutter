import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/appBar.dart';
import 'package:mobile/components/listTileEntry.dart';
import 'package:mobile/components/product_item.dart';
import 'package:mobile/models/entry_model.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/services/orders_api_provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage(this.searchText);

  final String searchText;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> products = [];
  Object? _value = 1;

  List<String> categoryTitles = [
    "Снековая продукция",
    "Сырная продукция",
    "Рыбная продукция",
    "Мясная продукция"
  ];

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
            title: Text('Результаты',
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
                height: MediaQuery.of(context).size.height * 0.79,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) => ProductItem(
                      products[index],
                      products[index].category != 0
                          ? categoryTitles[products[index].category]
                          : 'Без категорий',
                      false),
                ),
              ),
            ])),
          ],
        ));
  }

  void getProducts() async {
    var response = await OrdersProvider().getOrdersBySearch(widget.searchText);

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
