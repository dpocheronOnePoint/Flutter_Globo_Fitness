import 'package:flutter/material.dart';
import 'package:flutter_globo_fitness/data/models/weather.dart';
import '../data/Helpers/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController textLatitudeController = TextEditingController();
  final TextEditingController textLongitudeController = TextEditingController();

  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: textLatitudeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter the latitude',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: getData,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: textLongitudeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter the longitude',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: getData,
                      )),
                ),
              ),
              weatherRow('Place', result.name),
              weatherRow('Description', result.description),
              weatherRow('Temperature', result.temperature.toStringAsFixed(2)),
              weatherRow('Perceived', result.perceived.toStringAsFixed(2)),
              weatherRow('Pressure', result.pressure.toString()),
              weatherRow('Humidity', result.humidity.toString()),
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(
        textLatitudeController.text, textLongitudeController.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3, // This Text 3/7 of screen width
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            flex: 4, // This Text 4/7 of screen width
            child: Text(
              value,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          )
        ],
      ),
    );

    return row;
  }
}
