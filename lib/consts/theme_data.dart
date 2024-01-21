import 'package:flutter/material.dart';

class Styles{
  static ThemeData themeData(bool isDarkTheme, BuildContext context)
  {
    return ThemeData(
      scaffoldBackgroundColor: 
        isDarkTheme ? const Color(0xff2E1A47) : const Color(0xffFDEEF4),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: isDarkTheme ? const Color(0xff2E1A47) : const Color(0xffFDEEF4),
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
      cardColor: 
        isDarkTheme ? const Color(0xff2E1A47) : const Color(0xffFDEEF4),
      canvasColor: isDarkTheme ? const Color(0xff2E1A47) : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme
        ? const ColorScheme.dark()
        : const ColorScheme.light()
      ),
    );
  }
}
