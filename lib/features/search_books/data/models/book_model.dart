import 'package:books/features/search_books/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required isbn,
    required title,
    required publisher,
    required publishingDate,
    required publishingCountry,
    required description,
    required imageLink,
    required pageCount,
  }): super(
    isbn:isbn,
    title: title,
    publisher: publisher,
    publishingDate: publishingDate,
    publishingCountry: publishingCountry,
    description: description,
    imageLink: imageLink,
    pageCount: pageCount,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final isbnList = json['volumeInfo']['industryIdentifiers'];
    var isbn = "";
    for(final element in isbnList??''){
      if(element['type'] && element['type']=="ISBN_13") {
        isbn = element['identifier'];
      }
    }

    return BookModel(
      isbn: isbn,
      title: json['volumeInfo']['title']??'',
      publisher: json['volumeInfo']['publisher']??'',
      publishingDate: json['volumeInfo']['publishedDate']??'',
      publishingCountry: json['saleInfo']['country']??'',
      description: json['volumeInfo']['description']??'',
      imageLink: json['volumeInfo']['imageLinks']['medium']??
          json['volumeInfo']['imageLinks']['small']??
          json['volumeInfo']['imageLinks']['large']??
          json['volumeInfo']['imageLinks']['thumbnail']??
          json['volumeInfo']['imageLinks']['smallThumbnail']??
          '',
      pageCount: json['volumeInfo']['pageCount']??0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isbn':isbn,
      'title': title,
      'publisher': publisher,
      'publishingDate': publishingDate,
      'publishingCountry': publishingCountry,
      'description': description,
      'imageLink': imageLink,
      'pageCount': pageCount,
    };
  }
}
