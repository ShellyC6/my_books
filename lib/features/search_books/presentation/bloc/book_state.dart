part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();
}

final class Empty extends BookState {
  @override
  List<Object> get props => [];
}

final class Loading extends BookState {
  @override
  List<Object> get props => [];
}

final class Loaded extends BookState {
  final Book book;

  const Loaded({required this.book});

  @override
  List<Object> get props => [book];
}

final class Error extends BookState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
