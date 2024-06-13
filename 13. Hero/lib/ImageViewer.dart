import 'package:flutter/material.dart';

enum ImageRoute {
  first('1', 'bmw'),
  twice('2', 'kia'),
  third('3', 'mazda'),
  fourth('4', 'lexus');

  final String path;
  final String tag;
  const ImageRoute(this.path, this.tag);
}

class ImageViewer extends StatelessWidget {
  final ImageRoute route;

  const ImageViewer(this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(route.tag),
        ),
        body: Center(
          child: Hero(
              tag: route.tag,
              child: SizedBox(
                width: size,
                height: size,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/${route.path}.jpeg')))),
              )),
        ));
  }
}
