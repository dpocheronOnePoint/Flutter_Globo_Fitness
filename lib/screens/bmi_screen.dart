import 'package:flutter/material.dart';
import 'package:flutter_globo_fitness/shared/menu_bottom.dart';
import 'package:flutter_globo_fitness/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController textHeightController = TextEditingController();
  final TextEditingController textWeightController = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightPlaceHolder = '';
  String weightPlaceHolder = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightPlaceHolder =
        'Please insert your height in ${(isMetric) ? 'meters' : 'inches'}';
    weightPlaceHolder =
        'Please insert your weight in ${(isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleMeasure,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric', style: TextStyle(fontSize: fontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Imperial', style: TextStyle(fontSize: fontSize)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: textHeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: heightPlaceHolder),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: textWeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: weightPlaceHolder),
              ),
            ),
            ElevatedButton(
              onPressed: findBMI,
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(textHeightController.text) ?? 0;
    double weight = double.tryParse(textWeightController.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
}
