import 'package:flutter/material.dart';

final ThemeData coreThemeData = new ThemeData(
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  accentColor: CoreColors.black[500],
  accentColorBrightness: Brightness.light,
  scaffoldBackgroundColor: CoreColors.background,
  canvasColor: CoreColors.background,
  fontFamily: 'Gilroy',
  textTheme: ThemeData.light()
      .textTheme
      .apply(
        bodyColor: Colors.black54,
        displayColor: Colors.black,
      )
      .copyWith(
        headline5: TextStyle(
          color: Colors.black,
        ),
        headline6: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          color: Colors.black54,
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black54,
  ),
);

class CoreColors {
  CoreColors._();

  static const _blackPrimaryValue = 0xFF000000;

  static const MaterialColor black = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50: const Color(0xFFe0e0e0),
      100: const Color(0xFFb3b3b3),
      200: const Color(0xFF808080),
      300: const Color(0xFF4d4d4d),
      400: const Color(0xFF262626),
      500: const Color(_blackPrimaryValue),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );

  static const primary = Color(0xFFFFCA40);
  static const secondary = Color(0xFF000000);
  static const grey = Color(0xFFEEEEEE);
  static const background = Color(0xFFF9F9F9);
}

class CorePadding {
  CorePadding._();

  static const normal = 16.0;
  static const smaller = normal / 2;
  static const small = normal - (normal / 2);
  static const big = normal + (normal / 2);
  static const bigger = normal * 2;
}

class CoreConstant {
  CoreConstant._();

  static const borderRadius = 20.0;
  static const sizeIcon = 16.0;
}
