import 'package:books/features/search_books/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Search page"),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 300,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: const [
                BookCard(),
                BookCard(),
                BookCard(),
              ],
            ),
          ),
        ],
      )
    );
  }
}