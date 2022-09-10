import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:responsive_builder/responsive_builder.dart';

class MyImage extends StatefulWidget {
  final imageUrl;
  var deviceScreenType;

  MyImage({
    this.imageUrl,
    this.deviceScreenType,
  });
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.imageUrl,
      (int _) => ImageElement()..src = widget.imageUrl,
    );

    return Container(
      height: widget.deviceScreenType == DeviceScreenType.mobile
          ? 180
          : widget.deviceScreenType == DeviceScreenType.tablet
              ? 190
              : 250.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: HtmlElementView(
        viewType: widget.imageUrl,
      ),
    );
  }
}
