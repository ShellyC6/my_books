import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(child: widget.child),
          ],
        ),
      ),
      mobile: (BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
