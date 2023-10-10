// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyImage extends StatelessWidget {
  String imageUrl;

  MyImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
          (int _) => ImageElement()..src = imageUrl,
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}





