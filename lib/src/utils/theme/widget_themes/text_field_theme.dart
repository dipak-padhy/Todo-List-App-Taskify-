import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TodoTextFormFieldTheme{
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
        errorStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w100,
            fontSize: 12,
            color: todoSecondaryColor),
        focusedErrorBorder:  UnderlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(5)),
            borderSide:
            BorderSide(color: todoSecondaryColor4, width: 5,)),
        errorBorder:  UnderlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(5)),
            borderSide:
            BorderSide(color: todoSecondaryColor5, width: 5,)),
        suffixIconColor: todoPrimaryColor,
        focusedBorder: UnderlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(5)),
            borderSide:
            BorderSide(color: todoSecondaryColor, width: 5,)),
        enabledBorder: UnderlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(5)),
            borderSide:
            BorderSide(color: todoSecondaryColor, width: 5,)),
        labelStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w100,
            fontSize: 16,
            color: todoSecondaryColor2),
      );

  static InputDecorationTheme lightInputDecorationTheme =
  const InputDecorationTheme(
    errorStyle: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w100,
        fontSize: 12,
        color: todoPrimaryColor2),
    focusedErrorBorder:  UnderlineInputBorder(
        borderRadius:BorderRadius.all(Radius.circular(5)),
        borderSide:
        BorderSide(color: todoSecondaryColor4, width: 5,)),
    errorBorder:  UnderlineInputBorder(
        borderRadius:BorderRadius.all(Radius.circular(5)),
        borderSide:
        BorderSide(color: todoSecondaryColor2, width: 5,)),
    suffixIconColor: todoPrimaryColor2,
    focusedBorder: UnderlineInputBorder(
        borderRadius:BorderRadius.all(Radius.circular(4)),
        borderSide:
        BorderSide(color: todoPrimaryColor2, width: 6,)),
    enabledBorder: UnderlineInputBorder(
        borderRadius:BorderRadius.all(Radius.circular(4)),
        borderSide:
        BorderSide(color: todoPrimaryColor2, width: 6,)),
    labelStyle: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w100,
        fontSize: 16,
        color: todoSecondaryColor2),
  );
}