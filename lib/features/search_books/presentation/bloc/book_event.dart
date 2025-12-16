part of 'book_bloc.dart';

sealed class BookEvent extends Equatable {
  const BookEvent();
}

class GetBookByIsbnEvent extends BookEvent {
  final String isbn;

  const GetBookByIsbnEvent(this.isbn);

  @override
  List<Object?> get props => [isbn];
}

class GetRandomBookEvent extends BookEvent {

  const GetRandomBookEvent();

  @override
  List<Object?> get props => [];
}
