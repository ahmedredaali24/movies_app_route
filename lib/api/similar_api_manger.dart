import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/SimilarResponse.dart';
import 'api_const.dart';

class SimilarApiManger {
  // https://api.themoviedb.org/3/movie/634492/similar?api_key=7fdaaf6372fc89fa838bf08fc2a3efa

  static Future<SimilarResponse?> getSimilarResponse(int movieId,
      {String language = "en", int? page}) async {
    Uri url = Uri.https(
        ApiConst.baseUrl, "${ApiConst.movieDetailsApi}/$movieId/similar", {
      "api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4",
      "language": language,
      "page": page?.toString() ?? "1"
    });
    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return SimilarResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
