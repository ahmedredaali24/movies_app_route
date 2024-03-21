import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/model/MovieDetail.dart';

import '../model/PopularResponse.dart';
import '../model/SimilarMovie.dart';

class MovieApiDetail {
  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4


  static Future <MovieDetail> getMovieDetails(int movieID) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.popularApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var movieDetailModel = MovieDetail.fromJson(json);
      return movieDetailModel;
    } catch (error) {
      rethrow;
    }
  }



}
