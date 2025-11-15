import 'package:flutter/material.dart';
import 'package:trying_flutter/home/home_page.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}