import 'dart:convert';

import 'package:books/core/error/exceptions.dart';
import 'package:books/features/search_books/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract class BookRemoteDataSource {
  Future<BookModel> getBookByIsbn(String isbn);
  Future<BookModel> getRandomBook(String publisher, int index);
  Future<BookModel> getBookByGoogleId(String id);
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

  @override
  Future<BookModel> getBookByGoogleId(String id) async {
    final response = await client.get(
        Uri.parse('https://www.googleapis.com/books/v1/volumes/$id?'
            'fields=id,volumeInfo(title,authors,publisher,publishedDate,description,industryIdentifiers,pageCount),saleInfo/country')
    );

    if(response.statusCode == 200){
      return BookModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<String> _getGoogleId(String url) async {
    final response = await client.get(
        Uri.parse(url)
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body)['items'][0]['id'];
    } else {
      throw ServerException();
    }
  }

  Future<BookModel> _getBookFromUrl(String url) async {
    final String id = await _getGoogleId('$url&fields=items(id)');
    return getBookByGoogleId(id);
  }
}
