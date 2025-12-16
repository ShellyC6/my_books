import 'package:books/core/error/failures.dart';
import 'package:books/core/usecases/usecase.dart';
import 'package:books/features/search_books/domain/repositories/book_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/book.dart';

class GetBookByIsbn extends UseCase<Book, Params> {
  final BookRepository repository;

  GetBookByIsbn(this.repository);

  @override
  Future<Either<Failure, Book>> call(Params params) async {
    return await repository.getBookByIsbn(params.isbn);
  }
}

class Params extends Equatable {
  final String isbn;

  const Params({required this.isbn});

  @override
  List<Object?> get props => [isbn];
}