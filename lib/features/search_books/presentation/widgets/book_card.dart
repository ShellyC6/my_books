// created from https://stackoverflow.com/a/73824426   // Posted by Vitali   // Retrieved 2025-12-23, License - CC BY-SA 4.0

import 'package:books/features/search_books/presentation/widgets/book_cover_mobile.dart' if (dart.library.html) 'package:books/features/search_books/presentation/widgets/book_cover_web.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Center(child: BookCover(book.imageLink??'')),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black45,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Text(
                      book.title??'unknown',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.deepOrangeAccent,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.authors.toString(),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
