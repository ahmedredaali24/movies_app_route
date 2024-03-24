import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/model/GenreMovieDetails.dart';

class GenresMovieDetailsApi {
  // api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<GenreMovieDetails> genresMovieDetails(int genreID) async {
    var url = Uri.https(ApiConst.baseUrl, '/3/discover/movie', {
      'api_key': "7fdaaf6372fc89fa838bf08fc2a3efa4",
      "with_genres": '$genreID'
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var genreMovieDetails = GenreMovieDetails.fromJson(json);
      return genreMovieDetails;
    } catch (error) {
      rethrow;
    }
  }
}
