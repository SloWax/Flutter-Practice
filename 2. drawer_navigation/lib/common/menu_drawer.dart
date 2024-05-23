import 'package:drawer_navigation/screens/menu_screen.dart';
import 'package:flutter/material.dart';

enum MenuTitles {
  home('Home'),
  first('first'),
  twice('twice'),
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
  final List<MenuTitles> menuTitles = MenuTitles.values;
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
        switch (element) {
          case MenuTitles.home:
            Navigator.pop(context);
            break;
          default:
            screen = MenuScreen(element.title);
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
            break;
        }
      },
    ));
  }

  return menuItems;
}
