import 'package:flutter/material.dart';
import 'package:mobile/views/utills/const.dart';

Widget getButton(String text  ) {
  return Padding(
    padding: const EdgeInsets.only(top: 30, left: 20,right: 20),
    child: ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 30), // double.infinity is the width and 30 is the height
          primary: AppColors.green,
          padding: EdgeInsets.symmetric( vertical: 17),
          textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto")),
      child: Text(text),
    ),
  );
}
