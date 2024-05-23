import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final String data;

  const MenuScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data)),
      body: Center(child: FlutterLogo()),
    );
  }
}
