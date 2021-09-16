import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
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
          padding: const EdgeInsets.only(top: 8, left: 20),
          child: Text("Каталог продукции",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: "Roboto" ),),
        )
      ],
    );
  }
}
