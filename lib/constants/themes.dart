import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {

  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'dana',
        color: Colors.white, 
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        fontFamily: 'dana',
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 23
      ),
    ),
    unselectedWidgetColor: Color(0xFFCBD0DB),
    primaryColorLight: Color(0xFFF1F2F4),
    scaffoldBackgroundColor: Color(0xFF071E4B),
    primaryColor: Color(0xFF071E4B),
    secondaryHeaderColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black,opacity: 0.8),
    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: Colors.red,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.blue,
    // )
    // colorScheme: const ColorScheme.dark()
  );

  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'dana',
        color: Colors.black, 
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        fontFamily: 'dana',
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 23
      ),
    ),
    unselectedWidgetColor: Color(0xFF071E4B),
    primaryColorLight: Color(0xFF23498F),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFF3784E1),
    secondaryHeaderColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white , opacity: 0.8),

    // colorScheme: const ColorScheme.light()
  );

}
