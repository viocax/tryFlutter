import 'package:flutter/material.dart';
import 'package:trying_flutter/home/ui_component/calculator_pad.dart';
import 'package:trying_flutter/color_picker/color_picker_page.dart';
import 'package:trying_flutter/navigation/nav1_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CalculatorPad(),
          ColorPickerPage(),
          Nav1Page(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              icon: Icon(Icons.calculate),
              text: "計算機",
            ),
            Tab(
              icon: Icon(Icons.palette),
              text: "調色盤",
            ),
            Tab(
              icon: Icon(Icons.navigation),
              text: "Nav1.0",
            ),
          ],
        ),
      ),
    );
  }
}
