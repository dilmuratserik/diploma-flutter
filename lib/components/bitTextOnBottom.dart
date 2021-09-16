import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';
import 'package:mobile/views/utills/hex_color.dart';

TextStyle defaultStyle = TextStyle(color: HexColor.fromHex("#505050"), fontSize: 12.0);
TextStyle linkStyle = TextStyle(color: AppColors.gold);

Widget getBitText(String mainText, String text) {
  return RichText(
    text: TextSpan(
      style: defaultStyle,
      children: <TextSpan>[
        TextSpan(text: mainText),
        TextSpan(
            text: ' ' + text,
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Clicked ' + text);
              }),
      ],
    ),
  );
}