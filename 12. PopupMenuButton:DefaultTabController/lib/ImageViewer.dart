import 'package:flutter/material.dart';
import 'package:popupmenubutton/PopupMenuWidget.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  const ImageViewer(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imageUrl),
        actions: const [PopupMenuWidget()],
      ),
      body: Container(
          decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/$imageUrl.jpeg')),
      )),
    );
  }
}
