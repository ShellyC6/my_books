import 'package:books/features/search_books/presentation/widgets/book_card.dart';
import 'package:books/features/search_books/presentation/widgets/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/search_page_controller.dart';

import '../bloc/book_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          SearchPageController(key: key),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 300,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    switch (state) {
                      case Empty():
                        return const MessageDisplay(message: 'utilise les boutons ci-dessus pour chercher un livre');
                      case Loading():
                        return const MessageDisplay(message: 'loading...');
                      case Loaded():
                        return BookCard(state.book);
                      case Error():
                        return MessageDisplay(message: state.message);
                    }
                  },
                ),
                /*const BookCard(),
                const BookCard(),
                const BookCard(),*/
              ],
            ),
          ),
        ],
      )
    );
  }
}