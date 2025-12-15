import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';

abstract class BookRepository {
  Future<Either<Failure, Book>> getBookByIsbn(String isbn);
  Future<Either<Failure, Book>> getRandomBook(String publisher, int index);
}