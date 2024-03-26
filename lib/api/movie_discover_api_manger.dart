import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/MovieDiscoverResponse.dart';
import 'api_const.dart';

class MovieDiscoverApiManger {
  static Future<MovieDiscoverResponse?> getMoviesDiscoverResponse(
      {int? page}) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.movieDiscoverApi, {
      "api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4",
      "page": page?.toString() ?? "1"
    });

    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return MovieDiscoverResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
