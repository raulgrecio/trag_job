import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/screens/main/main_screen.dart';
import 'package:trag_work/controllers/MenuController.dart';
import 'views/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trag Work',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Gilroy',
              bodyColor: Colors.black54,
              displayColor: Colors.amber,
            ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black54,
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MenuController>(
              create: (_) => MenuController()),
        ],
        child: MainScreen(),
      ),
    );
  }
}
