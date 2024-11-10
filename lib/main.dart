import 'package:books/core/routes/router_generator.dart';
import 'package:books/features/manage_books/presentation/pages/bookshelf_page.dart';
import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'features/navigation/presentation/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (_, child) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (_) => MainPage(
              child: child ?? const BookshelfPage(),
            ),
          )
        ],
      ),
      initialRoute: routeBookshelf,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
