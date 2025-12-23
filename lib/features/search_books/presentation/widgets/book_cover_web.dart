// created from https://medium.com/@mrlimon28/flutter-web-troubleshooting-guide-2025-fixing-image-picker-database-screen-size-and-cors-issues-fef7e8676562

import 'dart:ui_web' if (dart.library.io) '' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as html;

class BookCover extends StatelessWidget {
  final String coverLink;
  late final String elementViewId;

  BookCover(this.coverLink, {super.key}) {
    if(coverLink!='') {
      _createHtmlImage(coverLink);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _chooseImage();
  }

  Widget _chooseImage() {
    if(coverLink !=''){
      return Container(
        alignment: Alignment.center,
        width: 250,
        height: 400,
        child: HtmlElementView(viewType: elementViewId),
      );
    } else {
      return Image.asset('assets/images/cover_unavailable.png');
    }
  }

  _createHtmlImage(String url) {
    elementViewId = 'view-${url.hashCode}';
    ui_web.platformViewRegistry.registerViewFactory(
      elementViewId,
          (int viewId, {Object? params}) {
        final imgElement = html.HTMLImageElement()
          ..src = url
          ..id = '$viewId-image';
        return imgElement;
      },
    );
  }
}
