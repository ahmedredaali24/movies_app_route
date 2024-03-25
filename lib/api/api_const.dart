class ApiConst {
  //  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4
  static const String baseUrl = "api.themoviedb.org";

  /// Popular Api Server
  static const String popularApi = "/3/tv/popular";

  /// Upcoming Api Server
  // https://api.themoviedb.org/3/movie/upcoming

  static const String upcomingApi = "/3/movie/upcoming";

  /// recommended Api Server
  //https://api.themoviedb.org/3/movie/top_rated

  static const String recommendedApi = "/3/movie/top_rated";

  //https://api.themoviedb.org/3/search/movie

  static const String searchApi = "/3/search/movie";

  // https://api.themoviedb.org/3/movie/{movie_id}/similar

  static const String similarApi = "/3/movie/{movie_id}/similar";

  //https://api.themoviedb.org/3/movie/{movie_id}
  static const String detailApi = "/3/movie/{movie_id}";
}
