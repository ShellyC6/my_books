import 'package:books/core/error/exceptions.dart';
import 'package:books/core/error/failures.dart';
import 'package:books/features/search_books/data/datasources/book_remote_data_source.dart';
import 'package:books/features/search_books/domain/entities/book.dart';
import 'package:books/features/search_books/domain/repositories/book_repository.dart';
import 'package:fpdart/fpdart.dart';

typedef _IsbnOrRandomChooser = Future<Book> Function();

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Book>> getBookByIsbn(String isbn) async {
    return await _getBook(() {
      return remoteDataSource.getBookByIsbn(isbn);
    });
  }

  @override
  Future<Either<Failure, Book>> getRandomBook({required String publisher, required int index}) async {
    return await _getBook(() {
      return remoteDataSource.getRandomBook(publisher, index);
    });
  }

  Future<Either<Failure, Book>> _getBook(_IsbnOrRandomChooser getIsbnOrRandom) async {
    try {
      final book = await getIsbnOrRandom();
      return Right(book);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}