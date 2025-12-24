import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String coverLink;

  const BookCover(this.coverLink, {super.key});

  @override
  Widget build(BuildContext context) {
    return _chooseImage();
  }

  Widget _chooseImage() {
    if(coverLink !=''){
      return Image.network(
        coverLink,
        fit: BoxFit.fill,
        width: 500,
        height: 500,
      );
    } else {
      return Image.asset('assets/images/cover_unavailable.png');
    }
  }
}
