class ApiConst {
  //  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4
  static const String baseUrl = "api.themoviedb.org";

  /// Popular Api Server
  static const String popularApi = "/3/tv/now-playing";

  /// Upcoming Api Server
  // https://api.themoviedb.org/3/movie/upcoming

  static const String upcomingApi = "/3/movie/upcoming";

  /// recommended Api Server
  //https://api.themoviedb.org/3/movie/top_rated

  static const String recommendedApi = "/3/movie/top_rated";

  ///Movie Details Api server

  // https://api.themoviedb.org/3/movie/{movie_id}
  static const String movieDetailsApi = "/3/movie";

  // https://api.themoviedb.org/3/search/movie?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  ///Search Api server
  static const String searchApi = "/3/search/movie";

  // https://api.themoviedb.org/3/movie/now_playing?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4
  ///now playing
  static const String nowPlayingApi = "/3/movie/now_playing";

  ///moviesList
  // https://api.themoviedb.org/3/genre/movie/list
  static const String moviesList = "/3/genre/movie/list";

  // https://api.themoviedb.org/3/discover/movie?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4
  ///movieDiscoverApi
  static const String movieDiscoverApi = "/3/discover/movie";
}
