import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';

import '../model/PopularResponse.dart';
import '../model/SimilarMovie.dart';

class SimilarApiMovie {
  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4


  static Future<SimilarMovie> getSimilarMovie(int movieID) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.popularApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var similarMovie = SimilarMovie.fromJson(json);
      return similarMovie;
    } catch (error) {
      rethrow;
    }
  }
}
