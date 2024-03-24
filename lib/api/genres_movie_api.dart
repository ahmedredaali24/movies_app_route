import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/model/GenresMovieModel.dart';

class GenresMovieApi {
  // api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<GenresMovieModel> getGenresMovie() async {
    var url = Uri.https(ApiConst.baseUrl, '/3/genre/movie/list', {
      'api_key': "7fdaaf6372fc89fa838bf08fc2a3efa4",
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var genreMovieModel = GenresMovieModel.fromJson(json);
      return genreMovieModel;
    } catch (error) {
      rethrow;
    }
  }
}
