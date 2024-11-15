import 'package:books/core/routes/routes.dart';
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

      // MOBILE
      mobile: (BuildContext context) => Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: onSelected,
          selectedIndex: index,
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
            Expanded(child: widget.child),
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
              selectedIndex: index,
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
                  Expanded(child: widget.child,),
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
              selectedIndex: index,
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
                  Expanded(child: widget.child,),
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
    String routeName;
    switch(newIndex){
      case 0:
        routeName = routeBookshelf;
        break;
      case 1:
        routeName = routeSearch;
        break;
      case 2:
        routeName = routeStats;
        break;
      default:
        routeName = routeBookshelf;
        break;
    }
    navKey.currentState?.pushNamed(routeName);
    setState(() {
      index = newIndex;
    });
  }
}
