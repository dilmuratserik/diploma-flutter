import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'const.dart';

// Форматирование номера телефона
class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

// Модальное окно загрузки
createAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Загрузка"),
                    SizedBox(
                      height: 20.0,
                    ),
                    SpinKitFadingCube(
                      color: Colors.grey,
                      size: 35,
                    ),
                  ],
                )));
      });
}

String? validatePassword(String password) {
  RegExp regexDigit = RegExp('[0-9]');
  RegExp regexLetter = RegExp("[a-z]");
  if (password.isEmpty) {
    return 'Введите пароль';
  } else {
    if (password.length <8) {
      return 'Пароль должен содержать не менее 8 символов';
    }
    else if (!regexLetter.hasMatch(password)) {
      return 'Пароль должен содержать как минимум одну букву';
    }
    else if (!regexDigit.hasMatch(password)) {
      return 'Пароль должен содержать как минимум одну цифру';
    }else {
      return null;
    }
  }
}

var errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.red, width: 1));

var enabledBorder =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide:
    BorderSide(color: Colors.grey, width: 1));

var focusedBorder = OutlineInputBorder(
    borderSide:
    BorderSide(color: AppColors.gold, width: 1));
