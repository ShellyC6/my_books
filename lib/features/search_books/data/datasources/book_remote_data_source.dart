import 'dart:convert';

import 'package:books/core/error/exceptions.dart';
import 'package:books/features/search_books/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract class BookRemoteDataSource {
  Future<BookModel> getBookByIsbn(String isbn);
  Future<BookModel> getRandomBook(String publisher, int index);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;

  BookRemoteDataSourceImpl({required this.client});

  @override
  Future<BookModel> getBookByIsbn(String isbn) async {
    return await _getBookFromUrl('https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn');
  }

  @override
  Future<BookModel> getRandomBook(String publisher, int index) async {
    return await _getBookFromUrl('https://www.googleapis.com/books/v1/volumes?q=inpublisher:$publisher&startIndex=$index&maxResults=${1}&orderBy=newest');
  }

  Future<BookModel> _getBookFromUrl(String url) async {
    final response = await client.get(
        Uri.parse(url)
    );

    if(response.statusCode == 200){
      return BookModel.fromJson(jsonDecode(response.body)['items'][0]);
    } else {
      throw ServerException();
    }
  }
}
