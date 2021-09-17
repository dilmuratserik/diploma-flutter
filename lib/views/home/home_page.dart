import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/product_item.dart';
import 'package:mobile/models/product_model.dart';
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
    "fish.jpg",
    "cheese.jpg",
    "meat.jpg"
  ];

  List<Product> titles = [
    Product(
        "Хиты продаж",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Сырная продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Рыбная продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Мясная продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
    Product(
        "Снековая продукция",
        ProductDescription("assets/images/cheese.jpg", "Фисташки Элит",
            "100 гр / Снековая продукция", "500 тг")),
  ];

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
                    print("clickerd");
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
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
                          "Снековая продукция",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          for (int i = 0; i < 3; i++) HomePageReccomendItem(titles[i])
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          //     child: Text(titles[i].mainTitle,
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          //   ),
          // for (int i = 0; i < 2; i++) ProductItem(titles[i]),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          //   child: TextButton(
          //       onPressed: () {},
          //       child: Text("Смотреть все товары",
          //           style: TextStyle(fontSize: 19, color: AppColors.gold))),
          // ),
          // for(int i =0; i <100;i++)
          //   Text("asdas"),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8.0),
          //     child: Image.asset(
          //           "assets/images/category_image.png",
          //       fit: BoxFit.contain,
          //       height: 250.0,
          //       width: 200.0,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class HomePageReccomendItem extends StatelessWidget {
  final Product product;

  const HomePageReccomendItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Text(product.mainTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
        ),
        for (int i = 0; i < 2; i++) ProductItem(product),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: TextButton(
              onPressed: () {},
              child: Text("Смотреть все товары",
                  style: TextStyle(fontSize: 18, color: AppColors.gold))),
        ),
      ],
    );
  }
}

// ClipRRect(
//   borderRadius: BorderRadius.circular(8.0),
//   child: Image.asset(
//     "assets/images/snack.jpg",
//     fit: BoxFit.cover,
//   ),
// ),
