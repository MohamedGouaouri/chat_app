import 'package:flutter/material.dart';

import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      theme: ThemeData(
          primarySwatch: MaterialColor(
            0xFF01afbd,
            {
              50: Color(0xFF01afbd),
              100: Color(0xFF01afbd),
              200: Color(0xFF01afbd),
              300: Color(0xFF01afbd),
              400: Color(0xFF01afbd),
              500: Color(0xFF01afbd),
              600: Color(0xFF01afbd),
              700: Color(0xFF01afbd),
              800: Color(0xFF01afbd),
              900: Color(0xFF01afbd),
            },
          ),
          fontFamily: "KleeOne"),
      home: HomePage(),
    );
  }
}
