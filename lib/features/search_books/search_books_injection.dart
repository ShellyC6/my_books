part of '../../injection_container.dart';

void searchBooksInit() {
  //! Features - Book
  //Bloc
  sl.registerFactory(
      () => BookBloc(
        getRandomBook: sl(),
        getBookByIsbn: sl(),
      ),
  );
  //Use Cases
  sl.registerLazySingleton(() => GetBookByIsbn(sl()));
  sl.registerLazySingleton(() => GetRandomBook(sl()));
  //Repositories
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
    remoteDataSource: sl(),
  ));
  //Data Sources
  sl.registerLazySingleton<BookRemoteDataSource>(() => BookRemoteDataSourceImpl(
    client: sl(),
  ));

  //! Core

  //! External
  sl.registerLazySingleton(() => http.Client());
}
