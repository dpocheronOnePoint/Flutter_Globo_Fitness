import 'package:flutter/material.dart';

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
      menuItems.add(
        ListTile(
          title: Text(
            menuTitle,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
    }
    return menuItems;
  }
}
