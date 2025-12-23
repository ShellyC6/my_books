import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String? isbn;
  final String? googleId;
  final String? title;
  final List? authors;
  final String? publisher;
  final String? publishingDate;
  final String? publishingCountry;
  final String? description;
  final String? imageLink;
  final int? pageCount;

  const Book({
    this.isbn, this.googleId, this.title, this.authors, this.publisher, this.publishingDate, this.publishingCountry, this.description, this.imageLink, this.pageCount
  });

  @override
  List<Object> get props => [
    isbn??'',
    googleId??'',
    title??'',
    authors??[],
    publisher??'',
    publishingDate??'',
    publishingCountry??'',
    description??'',
    imageLink??'',
    pageCount??0,
  ];
}