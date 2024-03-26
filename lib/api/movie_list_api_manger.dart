import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/MovieListResponse.dart';
import 'api_const.dart';

class MovieListApiManger {
  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<MovieListResponse?> getMoviesListResponse() async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.moviesList,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});

    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return MovieListResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
