import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';

import '../model/PopularResponse.dart';

class PopularApiManger {
  // https://api.themoviedb.org/3/tv/popular?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<PopularResponse?> getPopularResponse() async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.popularApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});

    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
