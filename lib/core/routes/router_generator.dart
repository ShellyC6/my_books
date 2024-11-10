import 'package:books/features/manage_books/presentation/pages/bookshelf_page.dart';
import 'package:books/features/search_books/presentation/pages/search_page.dart';
import 'package:books/features/stats/presentation/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:books/core/routes/routes.dart';
import 'package:books/core/routes/unanimated_page_route.dart';

import '../../main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeBookshelf:
        return UnanimatedPageRoute(builder: (_) => const BookshelfPage());
      case routeSearch:
        return UnanimatedPageRoute(builder: (_) => const SearchPage());
      case routeStats:
        return UnanimatedPageRoute(builder: (_) => const StatsPage());
      default:
        return UnanimatedPageRoute(builder: (_) => const BookshelfPage());
    }
  }
}