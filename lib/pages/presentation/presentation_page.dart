import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  _PresentationPageState createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  CarouselController buttonCarouselController = CarouselController();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  var count = 0;
  int _current = 0;
  List imgList = [];

  @override
  void initState() {
    for (var i = 0; i < 5; i++) {
      imgList.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CarouselSlider.builder(
          itemCount: 5,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            initialPage: 0,
            onScrolled: (on) async {

              print("onScrolled");
              print(on);
            },
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, CarouselPageChang) {
              print(index);
              setState(() {
                _current = index;
              });
            },
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $itemIndex',
                            style: TextStyle(fontSize: 16.0),
                          ))),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imgList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.redAccent : Colors.green,
              ),
            );
          }),
        ),
        SizedBox(
          height: 20.0,
        ),
        if (count == 0)
          ElevatedButton(
            style: style,
            onPressed: slidePage,
            child: Text("next"),
          )
        else
          ElevatedButton(
            style: style,
            onPressed: slidePage,
            child: Text("plplss"),
          )
      ]),
    );
  }

  void slidePage() {
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
    setState(() {
      count += 1;
    });
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
