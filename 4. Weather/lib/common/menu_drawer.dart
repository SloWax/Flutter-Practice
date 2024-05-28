import 'package:flutter/material.dart';
import 'package:package_http/screens/bmi_screen.dart';
import 'package:package_http/screens/setting_screen.dart';
import 'package:package_http/screens/weather_screen.dart';

enum MenuTitles {
  home('Home'),
  first('체질량 계산기'),
  twice('날씨'),
  third('third');

  final String title;
  const MenuTitles(this.title);
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: buildMenuItems(context),
    ));
  }
}

List<Widget> buildMenuItems(BuildContext context) {
  const List<MenuTitles> menuTitles = MenuTitles.values;
  List<Widget> menuItems = [];

  menuItems.add(const DrawerHeader(
    decoration: BoxDecoration(color: Colors.indigo),
    child: Text(
      "Envy's App",
      style: TextStyle(color: Colors.white, fontSize: 28),
    ),
  ));

  for (var element in menuTitles) {
    Widget screen = Container();

    menuItems.add(ListTile(
      title: Text(element.title, style: const TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pop(context);

        switch (element) {
          case MenuTitles.home:
            break;
          case MenuTitles.first:
            screen = const BmiScreen();
            break;
          case MenuTitles.twice:
            screen = const WeatherScreen();
          default:
            screen = SettingScreen(element.title);
            break;
        }

        if (element != MenuTitles.home) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        }
        
      },
    ));
  }

  return menuItems;
}
