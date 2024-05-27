import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final String data;

  const SettingScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data)),
      body: Center(child: FlutterLogo()),
    );
  }
}
