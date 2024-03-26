import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/UpcomingResponse.dart';
import 'api_const.dart';

class UpcomingApiManger {
  // https://api.themoviedb.org/3/movie/upcoming?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<UpcomingResponse?> getUpcomingResponse({int? page}) async {
    Uri url = Uri.https(
      ApiConst.baseUrl,
      ApiConst.upcomingApi,
      {
        "api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4",
        "page": page?.toString() ?? "1"
      },
    );

    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);

      return UpcomingResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
