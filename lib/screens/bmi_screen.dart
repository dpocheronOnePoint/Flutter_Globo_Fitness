import 'package:flutter/material.dart';
import 'package:flutter_globo_fitness/shared/menu_bottom.dart';
import 'package:flutter_globo_fitness/shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
        child: FlutterLogo(),
      ),
    );
  }
}