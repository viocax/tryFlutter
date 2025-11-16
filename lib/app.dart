import 'package:flutter/material.dart';
import 'package:trying_flutter/home/home_page.dart';
import 'package:trying_flutter/navigation/route_generator.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: RouteGenerator.onUnknownRoute,
    );
  }
}