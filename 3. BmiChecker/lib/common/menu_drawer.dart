import 'package:flutter/material.dart';
import 'package:state_btn_tf/screens/bmi_screen.dart';
import 'package:state_btn_tf/screens/setting_screen.dart';

enum MenuTitles {
  home('Home'),
  first('체질량 계산기'),
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
            screen = BmiScreen();
            Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
            break;
          default:
            screen = SettingScreen(element.title);
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
            break;
        }
      },
    ));
  }

  return menuItems;
}
