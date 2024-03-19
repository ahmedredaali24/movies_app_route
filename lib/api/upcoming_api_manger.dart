import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/model/UpcomingResponse.dart';

class UpcomingApiManger {
  // https://api.themoviedb.org/3/movie/upcoming?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<UpcomingResponse?> getUpcomingResponse() async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.upcomingApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});

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
