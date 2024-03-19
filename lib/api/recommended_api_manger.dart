import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/model/RecommendedResponse.dart';

class RecommendedApiManger {
  static Future<RecommendedResponse?> getRecommendedResponse() async {
    //https://api.themoviedb.org/3/movie/top_rated?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.recommendedApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});
    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return RecommendedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
