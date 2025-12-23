import 'package:books/features/search_books/data/datasources/book_remote_data_source.dart';
import 'package:books/features/search_books/data/repositories/book_repository_impl.dart';
import 'package:books/features/search_books/domain/repositories/book_repository.dart';
import 'package:books/features/search_books/domain/usecases/get_book_by_isbn.dart';
import 'package:books/features/search_books/domain/usecases/get_random_book.dart';
import 'package:books/features/search_books/presentation/bloc/book_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

part 'features/search_books/search_books_injection.dart';

final sl = GetIt.instance;

void init() {
  searchBooksInit();
}
