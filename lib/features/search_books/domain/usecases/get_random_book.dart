import 'dart:math';

import 'package:books/core/usecases/usecase.dart';
import 'package:books/features/search_books/domain/repositories/book_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';

class GetRandomBook extends UseCase<Book, NoParams> {
  final BookRepository repository;

  GetRandomBook(this.repository);

  @override
  Future<Either<Failure, Book>> call(NoParams params) async {
    const publishers = ['kana', 'kurokawa', 'pika', 'glénat', 'le+lézard+noir',];

    // generates a new Random object
    final random = Random();

    // generate a random index based on the list length
    // and use it to retrieve the element
    var chosenPublisher = publishers[random.nextInt(publishers.length)];

    return await repository.getRandomBook(publisher: chosenPublisher, index: random.nextInt(100));
  }
}