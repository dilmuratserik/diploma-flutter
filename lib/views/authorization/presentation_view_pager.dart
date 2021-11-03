import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/views/authorization/signin_page.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';

class ViewPager extends StatefulWidget {
  const ViewPager({Key? key}) : super(key: key);

  @override
  _ViewPagerState createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {

  var _currentIndex = 0;
  final PageController controller = PageController(initialPage: 0);
  // var screenWidth = 0;
  // var screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    // screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 00),
                child: Container(
                  height: 300,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: <Widget>[
                      Center(
                        child:
                            SvgPicture.asset("assets/images/presentation1.svg"),
                      ),
                      Center(
                        child:
                            SvgPicture.asset("assets/images/presentation2.svg"),
                      ),
                      Center(
                        child:
                            SvgPicture.asset("assets/images/presentation3.svg"),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "Регистрация",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,
                fontFamily: "Roboto"),
              ),
              Divider(
                color: Colors.amber,
                thickness: 2,
                indent: 170,
                endIndent: 170,
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22,30,22,50),
                child: Center(
                    child: Text(
                      "Если Вы не являетесь владельцем организации или магазина, нажмите “Физическое лицо”",
                      style: TextStyle(color: AppColors.presentationGray,
                        fontSize: 18, fontFamily: "Roboto"
                      ),textAlign: TextAlign.center,
                    ),
                  ),
              ),
              new DotsIndicator(
                dotsCount: 3,
                position: _currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: HexColor.fromHex("#D9D9D9"),
                  activeColor: AppColors.gold,
                  size: const Size.square(9.0),
                  activeSize: const Size(25.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          ),
          if (_currentIndex == 2) _getButton() else _getText()
        ],
      ),
    );
  }

  Widget _getText() {
    return Padding(
      padding: const EdgeInsets.only(top : 20),
      child: TextButton(
        onPressed: () {
          controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
        child: Text(
          "Пропустить",
          style: TextStyle(
              color: AppColors.green,
              fontSize: 18,
              fontWeight: FontWeight.w500,
          fontFamily: "Roboto"),
        ),
      ),
    );
  }

  Widget _getButton() {

    return Padding(
      padding: const EdgeInsets.only(top : 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: AppColors.green,
            padding: EdgeInsets.symmetric(horizontal: 145, vertical: 17),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Roboto")),
        child: Text("Начать"),
      ),
    );
  }
}
