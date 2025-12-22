import 'package:books/features/search_books/presentation/widgets/book_cover.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(book.title??'unknown'),
            const SizedBox(height: 10),
            Expanded(
              child: BookCover(book.imageLink??''),
            ),
            const SizedBox(height: 10),
            const Text("Suzanne Collins"),
            Text(book.publishingDate??'unknown'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
