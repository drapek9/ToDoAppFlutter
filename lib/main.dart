import 'package:flutter/material.dart';
import 'package:to_to_apka/loading/loading_screen.dart';
import 'package:to_to_apka/home_page/homepage_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/loading",
      routes: {
        "/loading": (context) => LoadingScreen(),
        "/home": (context) => MainScreen()
      },
    )
  );
}

