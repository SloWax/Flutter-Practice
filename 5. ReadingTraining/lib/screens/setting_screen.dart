import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final String data;

  const SettingScreen(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data)),
      body: const Center(child: FlutterLogo()),
    );
  }
}
