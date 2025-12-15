import 'package:books/features/login_logout/presentation/pages/login_page.dart';
import 'package:books/features/bookshelf/presentation/pages/bookshelf_page.dart';
import 'package:books/features/search_books/presentation/pages/search_page.dart';
import 'package:books/features/stats/presentation/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/routes/routes.dart';
import 'features/navigation/presentation/pages/main_page.dart';

// GoRouter configuration
// router created using :
// https://github.com/flutter/packages/blob/36383d6b0cd41f54bceea788f844c7c2ec93044d/packages/go_router/example/lib/stateful_shell_route.dart

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/bookshelf',
  routes: [

    GoRoute(
      name: AppRouteName.login,
      path: AppRoutePath.login,
      builder: (context, state) => const LoginPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
          ) {
        return MainPage(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            name: AppRouteName.bookshelf,
            path: AppRoutePath.bookshelf,
            builder: (context, state) => const BookshelfPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: AppRouteName.search,
            path: AppRoutePath.search,
            builder: (context, state) => const SearchPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: AppRouteName.stats,
            path: AppRoutePath.stats,
            builder: (context, state) => const StatsPage(),
          ),
        ]),
      ],
    )
  ]
);

// MyApp

Future<void> main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
