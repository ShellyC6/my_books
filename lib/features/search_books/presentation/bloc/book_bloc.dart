import 'package:books/core/usecases/usecase.dart';
import 'package:books/features/search_books/domain/entities/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_book_by_isbn.dart';
import '../../domain/usecases/get_random_book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBookByIsbn getBookByIsbn;
  final GetRandomBook getRandomBook;

  BookBloc({
    required this.getRandomBook,
    required this.getBookByIsbn,
  }) : super(Empty()) {

    on<GetBookByIsbnEvent>((event, emit) async {
      emit(Loading());
      final bookOrFailure = await getBookByIsbn(Params(isbn: event.isbn));
      emit(bookOrFailure.fold(
            (failure) => Error(message: failure.errorMessage),
            (book) => Loaded(book: book),
      ));
    });

    on<GetRandomBookEvent>((event, emit) async {
      emit(Loading());
      final bookOrFailure = await getRandomBook(NoParams());
      emit(bookOrFailure.fold(
            (failure) => Error(message: failure.errorMessage),
            (book) => Loaded(book: book),
      ));
    });
  }
}
