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

    var bookData = {
      'isbn': "",
      'title': "",
      'publisher': "",
      'publishingDate': "",
      'publishingCountry': "",
      'description': "",
      'imageLink': "",
      'pageCount': 0,
    };

    if(json['volumeInfo'] != null) {
      // isbn
      if(json['volumeInfo']['industryIdentifiers'] != null) {
        final isbnList = json['volumeInfo']['industryIdentifiers'];
        for(final element in isbnList){
          if(element['type']=="ISBN_13") {
            bookData['isbn'] = element['identifier'];
          }
        }
      }
      // title
      bookData['title'] = json['volumeInfo']['title']??'inconnu';
      // publisher
      bookData['publisher'] = json['volumeInfo']['title']??'inconnu';
      // publishing date
      if(json['volumeInfo']['publishedDate'] != null) {
        // try to parse the date to get the year, if unsuccessful then keep the whole string
        // when it can't be parse, 'publishedDate' usually has only the year
        try{
          final date = DateTime.parse(json['volumeInfo']['publishedDate']);
          bookData['publishingDate'] = "${date.year}";
        } catch (_) {
          bookData['publishingDate'] = json['volumeInfo']['publishedDate'];
        }
      }
      // description
      bookData['description'] = json['volumeInfo']['description']??'inconnu';
      // image link
      if(json['volumeInfo']['imageLinks'] != null) {
        bookData['imageLink'] = json['volumeInfo']['imageLinks']['medium']??
            json['volumeInfo']['imageLinks']['small']??
            json['volumeInfo']['imageLinks']['large']??
            json['volumeInfo']['imageLinks']['thumbnail']??
            json['volumeInfo']['imageLinks']['smallThumbnail']??
            '';
      }
      // page count
      bookData['pageCount'] = json['volumeInfo']['pageCount']??0;
    }
    if(json['saleInfo'] != null) {
      // publishing country
      bookData['publishingCountry'] = json['saleInfo']['country']??'inconnu';
    }

    return BookModel(
      isbn: bookData['isbn'],
      title: bookData['title'],
      publisher: bookData['publisher'],
      publishingDate: bookData['publishingDate'],
      publishingCountry: bookData['publishingCountry'],
      description: bookData['description'],
      imageLink: bookData['imageLink'],
      pageCount: bookData['pageCount'],
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
