abstract class AppRouteName {
  static const login = "login";
  static const bookshelf = "bookshelf";
  static const search = "search";
  static const stats = "stats";
}

abstract class AppRoutePath {
  static const login = "/login";
  static const bookshelf = "/bookshelf";
  static const search = "/search";
  static const stats = "/stats";
}

abstract class AppRouteIndex {
  static const bookshelf = 0;
  static const search = 1;
  static const stats = 2;
}
