import 'package:flutter/material.dart';
import 'package:flutter_globo_fitness/screens/session_screen.dart';
import 'package:flutter_globo_fitness/screens/weather_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Trainning'
    ];

    List<Widget> menuItems = [];

    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'Globo Fitness',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );

    for (var menuTitle in menuTitles) {
      Widget screen = Container();
      menuItems.add(
        ListTile(
          title: Text(
            menuTitle,
            style: const TextStyle(fontSize: 18),
          ),
          onTap: () {
            switch (menuTitle) {
              case 'Home':
                screen = const IntroScreen();
                break;
              case 'BMI Calculator':
                screen = const BmiScreen();
                break;
              case 'Weather':
                screen = const WeatherScreen();
                break;
              case 'Trainning':
                screen = const SessionScreen();
                break;
            }
            // To hide the drawer when you click
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => screen),
            );
          },
        ),
      );
    }
    return menuItems;
  }
}
