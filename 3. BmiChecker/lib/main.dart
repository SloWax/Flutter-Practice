import 'package:flutter/material.dart';
import 'package:state_btn_tf/common/menu_drawer.dart';
import 'package:state_btn_tf/screens/intro_screen.dart';
import 'package:state_btn_tf/screens/setting_screen.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MainWidget(),
    // routes: {
    //   Routes.home.id: (context) => IntroScreen(),
    //   Routes.menu.id: (context) => MenuScreen('Menu')
    // },
    // initialRoute: Routes.home.id,
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int selectedIndex = 0;

  static const List<Widget> widgetOptions = <Widget>[
    IntroScreen(),
    SettingScreen('')
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Hello Wolrd'), backgroundColor: Colors.indigo),
        drawer: const MenuDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
        body: widgetOptions.elementAt(selectedIndex));
  }
}

// enum Routes {
//   home('/'),
//   menu('/menu');

//   final String id;
//   const Routes(this.id);
// }
