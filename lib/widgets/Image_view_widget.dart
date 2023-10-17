import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  String imageUrl;

  MyImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String imgUrl = "$imageUrl";

// https://github.com/flutter/flutter/issues/41563
// ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       imgUrl,
//           (int _) => ImageElement()..src = imgUrl,
//     );
//     return HtmlElementView(
//       viewType: imgUrl,
//     );

    return Image.network(imageUrl,fit: BoxFit.fitWidth);

  }
}