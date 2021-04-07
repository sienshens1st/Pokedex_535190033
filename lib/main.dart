import 'package:flutter/material.dart';
import 'package:pokedex_untar_535190033/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokedeX",
      theme: ThemeData(
        primaryColor: Colors.red,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}



