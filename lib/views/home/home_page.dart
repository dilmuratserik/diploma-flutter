import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/product_item.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/services/orders_api_provider.dart';
import 'package:mobile/views/categories/category_products.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final PageController controller = PageController(initialPage: 0);
  List<String> assetImages = [
    "snack.jpg",
    "cheese.jpg",
    "fish.jpg",
    "meat.jpg"
  ];

  List<String> categoryTitles = [
    "Снековая продукция",
    "Сырная продукция",
    "Рыбная продукция",
    "Мясная продукция"
  ];

  List<Product> productsHits = [];
  List<Product> productsCategory1 = [];
  List<Product> productsCategory2 = [];
  List<Product> productsCategory3 = [];
  List<Product> productsCategory4 = [];

  @override
  void initState() {
    getHits();
    getRecommendations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      "assets/images/banner.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      "assets/images/banner.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      "assets/images/banner.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: new DotsIndicator(
              dotsCount: 3,
              position: _currentIndex.toDouble(),
              decorator: DotsDecorator(
                color: HexColor.fromHex("#D9D9D9"),
                activeColor: AppColors.gold,
                size: const Size.square(9.0),
                activeSize: const Size(9.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Каталог продукции",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  fontFamily: "Roboto"),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryProductsPage(
                                categoryTitles[index],
                                index.toString(),
                                '1',
                                false)));
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/images/${assetImages[index]}"),
                          ),
                        ),
                        height: MediaQuery.of(context).size.width / 2 - 60,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          categoryTitles[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Хиты продаж',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              ),
              for (int i = 0; i < productsHits.length; i++)
                ProductItem(productsHits[i],
                    categoryTitles[productsHits[i].category], false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Снековая продукция',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              ),
              for (int i = 0; i < productsCategory1.length; i++)
                ProductItem(productsCategory1[i],
                    categoryTitles[productsCategory1[i].category], false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryProductsPage(
                                  'Снековая продукция', '3', '1', false)));
                    },
                    child: Text("Смотреть все товары",
                        style: TextStyle(fontSize: 16, color: AppColors.gold))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Рыбная продукция',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              ),
              for (int i = 0; i < productsCategory2.length; i++)
                ProductItem(productsCategory2[i],
                    categoryTitles[productsCategory2[i].category], false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryProductsPage(
                                  'Рыбная продукция', '2', '1', false)));
                    },
                    child: Text("Смотреть все товары",
                        style: TextStyle(fontSize: 16, color: AppColors.gold))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Сырная продукция',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              ),
              for (int i = 0; i < productsCategory3.length; i++)
                ProductItem(productsCategory3[i],
                    categoryTitles[productsCategory3[i].category], false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryProductsPage(
                                  'Сырная продукция', '1', '1', false)));
                    },
                    child: Text("Смотреть все товары",
                        style: TextStyle(fontSize: 16, color: AppColors.gold))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Мясная продукция',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              ),
              for (int i = 0; i < productsCategory4.length; i++)
                ProductItem(productsCategory4[i],
                    categoryTitles[productsCategory4[i].category], false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryProductsPage(
                                  'Мясная продукция', '4', '1', false)));
                    },
                    child: Text("Смотреть все товары",
                        style: TextStyle(fontSize: 16, color: AppColors.gold))),
              ),
            ],
          )
        ],
      ),
    );
  }

  void getHits() async {
    var response = await OrdersProvider().getHits();
    if (response['status'] == 'ok') {
      List<Product> tempList = [];
      for (var i in response['data']) {
        tempList.add(Product.fromJson(i));
      }
      setState(() {
        productsHits = tempList;
      });
    }
  }

  void getRecommendations() async {
    var response = await OrdersProvider().getRecommendations();
    if (response['status'] == 'ok') {
      List<Product> tempList1 = [];
      List<Product> tempList2 = [];
      List<Product> tempList3 = [];
      List<Product> tempList4 = [];
      for (var i in response['data']) {
        print(i);
        Product tempProduct = Product.fromJson(i);
        if (tempProduct.category == 1) {
          tempList1.add(tempProduct);
        } else if (tempProduct.category == 2) {
          tempList2.add(tempProduct);
        } else if (tempProduct.category == 3) {
          tempList3.add(tempProduct);
        } else if (tempProduct.category == 4) {
          tempList4.add(tempProduct);
        }
      }
      setState(() {
        productsCategory1 = tempList1;
        productsCategory2 = tempList2;
        productsCategory3 = tempList3;
        productsCategory4 = tempList4;
      });
    }
  }
}
