import 'package:flutter/material.dart';

class Styles{
  static ThemeData themeData(bool isDarkTheme, BuildContext context)
  {
    return ThemeData(
      scaffoldBackgroundColor: 
        isDarkTheme ? const Color(0xff2E1A47) : Color(0xFFF1E6FF),
        primaryColor: const Color(0xFF6F35A5),
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: isDarkTheme ? const Color(0xff2E1A47) : const Color(0xffFDEEF4),
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
      cardColor: 
        isDarkTheme ? const Color(0xFF6F35A5) : const Color(0xffFDEEF4),
      canvasColor: isDarkTheme ? const Color(0xFF6F35A5) : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme
        ? const ColorScheme.dark()
        : const ColorScheme.light()
      ),
    );
  }
}
