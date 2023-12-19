import 'package:flutter/material.dart';
import 'package:todo_list/src/constants/colors.dart';
import 'package:todo_list/src/utils/theme/widget_themes/text_field_theme.dart';


class TodoAppTheme{

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: todoSecondaryColor,
    colorScheme: const ColorScheme.light(),
    inputDecorationTheme: TodoTextFormFieldTheme.lightInputDecorationTheme,


  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: todoPrimaryColor2,
      colorScheme:const ColorScheme.dark(),
    inputDecorationTheme: TodoTextFormFieldTheme.darkInputDecorationTheme
  );

}