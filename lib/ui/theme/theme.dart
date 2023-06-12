import 'package:flutter/material.dart';

class ThemeClass {
  static final themeLight = ThemeData(
      fontFamily: '.SF Pro Display',
      appBarTheme: const AppBarTheme(
        toolbarHeight: 68,
        elevation: 0,
        color: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      textTheme: _textTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        selectedIconTheme: IconThemeData(color: Colors.blue),
        type: BottomNavigationBarType.fixed,
      ),
    );
}

const _textTheme = TextTheme(
  labelSmall: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400, letterSpacing: 0.1),
  titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),
  titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.1),
  labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.1)
);
