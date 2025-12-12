import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell child;

  const MainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(

      // MOBILE
      mobile: (BuildContext context) => Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: onSelected,
          selectedIndex: child.currentIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.book),
              icon: Icon(Icons.book_outlined),
              label: 'Bibliothèque',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.search),
              icon: Icon(Icons.search_outlined),
              label: 'Rechercher',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.query_stats),
              icon: Icon(Icons.query_stats_outlined),
              label: 'Statistiques',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: child),
            const Text('mobile'),
          ],
        ),
      ),

      // TABLET
      tablet: (BuildContext context) => Scaffold(
        body: Row(
          children: [
            NavigationRail(
              onDestinationSelected: onSelected,
              selectedIndex: child.currentIndex,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.book),
                  icon: Icon(Icons.book_outlined),
                  label: Text('Bibliothèque'),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.search),
                  icon: Icon(Icons.search_outlined),
                  label: Text('Rechercher'),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.query_stats),
                  icon: Icon(Icons.query_stats_outlined),
                  label: Text('Statistiques'),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: child,),
                  const Text('tablet')
                ],
              ),
            ),
          ],
        ),
      ),

      // DESKTOP
      desktop: (BuildContext context) => Scaffold(
        body: Row(
          children: [
            NavigationRail(
              onDestinationSelected: onSelected,
              selectedIndex: child.currentIndex,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.book),
                  icon: Icon(Icons.book_outlined),
                  label: Text('Bibliothèque'),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.search),
                  icon: Icon(Icons.search_outlined),
                  label: Text('Rechercher'),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.query_stats),
                  icon: Icon(Icons.query_stats_outlined),
                  label: Text('Statistiques'),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: child,),
                  const Text('desktop')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(int newIndex) {
    child.goBranch(newIndex);
  }
}
