import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/searchResponse.dart';
import 'api_const.dart';

class SearchApi {
  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<SearchResponse?> searchMovie(String query) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.searchApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4", "query": query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
