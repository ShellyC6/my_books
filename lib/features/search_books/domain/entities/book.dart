import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String? isbn;
  final String? title;
  final String? publisher;
  final String? publishingDate;
  final String? publishingCountry;
  final String? description;
  final String? imageLink;
  final int? pageCount;

  const Book(
    this.isbn, this.title, this.publisher, this.publishingDate, this.publishingCountry, this.description, this.imageLink, this.pageCount
  );

  @override
  List<Object> get props => [
    isbn??'',
    title??'',
    publisher??'',
    publishingDate??'',
    publishingCountry??'',
    description??'',
    imageLink??'',
    pageCount??0,
  ];
}