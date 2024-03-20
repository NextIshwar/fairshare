import 'package:flutter/material.dart';

class Themes {
  static ThemeData get lightTheme {
    return ThemeData(

        ///[focusColor] this is used in icons color and textforms

        );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      dividerColor: const Color(0XFF444444),
      primaryColor: const Color(0XFF1E1E1E),
      primaryColorLight: const Color(0XFF262626),
      primaryColorDark: const Color(0XFF222222),
      buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.dark(secondary: Colors.black),
        buttonColor: Color.fromRGBO(255, 195, 63, 1),
        textTheme: ButtonTextTheme.accent,
      ),
      highlightColor: const Color.fromRGBO(255, 195, 63, 1),
      colorScheme: const ColorScheme.dark(inversePrimary: Color(0XFF1E1E1E)),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Colors.grey[400],
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        // headlineMedium: TextStyle(
        //   color: Colors.grey,
        // ),
        // headlineSmall: TextStyle(
        //   fontSize: 16,
        //   color: const Color(0xff7B8497).withOpacity(0.6),
        //   fontWeight: FontWeight.w500,
        // ),
        // titleLarge: const TextStyle(
        //   fontSize: 20,
        //   color:  Colors.grey[400],
        // ),
        // bodyLarge: const TextStyle(
        //   color: Color(0xff141925),
        // ),
        // bodyMedium: const TextStyle(
        //   color: Color(0xff7CB1BD),
        //   fontWeight: FontWeight.w500,
        // ),
        titleMedium: const TextStyle(
          color: Color(0XFF444444),
          fontSize: 14,
        ),
        bodyMedium: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        titleSmall: const TextStyle(
          color: Color.fromARGB(255, 112, 112, 112),
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        // labelLarge: TextStyle(
        //   fontSize: 16,
        //   color:  Colors.grey[400].withOpacity(0.6),
        // ),
      ),
    );
  }

  static ThemeData getThemeData(int theme) {
    if (theme == THEME.light.index) {
      return Themes.lightTheme;
    } else if (theme == THEME.dark.index) {
      return Themes.darkTheme;
    } else {
      return Themes.lightTheme;
    }
  }

  static const Color secondaryColor = Color(0xFF00ABB8);
  static Color appBarColor = Colors.grey[400]!;
}

enum THEME { light, dark }
