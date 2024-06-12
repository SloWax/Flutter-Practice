import 'package:flutter/material.dart';
import 'package:popupmenubutton/PopupMenuWidget.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
              title: const Text('Popup/TopBar'),
              actions: const [PopupMenuWidget()],
              bottom: TabBar(tabs: [
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.zero.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.first.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.twice.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.third.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.fourth.name),
              ])),
          body: TabBarView(
            children: [
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/0.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/1.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/2.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/3.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/4.jpeg')),
              )),
            ],
          ),
        ));
  }
}
