import 'package:flutter/material.dart';
import 'package:to_to_apka/loading/loading_screen.dart';
import 'package:to_to_apka/home_page/homepage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/loading",
      routes: {
        "/loading": (context) => LoadingScreen(),
        "/home": (context) => MainScreen()
      },
    );
  }
}

