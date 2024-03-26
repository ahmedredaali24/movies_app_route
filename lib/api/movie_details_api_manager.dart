import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/MovieDetails.dart';
import 'api_const.dart';

class MovieDetailsApiManger {
  static Future<MovieDetails?> getMovieDetailsResponse(int movieId) async {
    Uri url = Uri.https(
        ApiConst.baseUrl,
        "${ApiConst.movieDetailsApi}/$movieId",
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});

    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return MovieDetails.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
