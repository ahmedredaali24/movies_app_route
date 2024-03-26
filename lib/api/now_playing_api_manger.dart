import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NowPlaying.dart';
import 'api_const.dart';

class NowPlayingApiManger {
  // https://api.themoviedb.org/3/movie/now_playing?api_key=7fdaaf6372fc89fa838bf08fc2a3efa4

  static Future<NowPlaying?> getNowPlayingResponse() async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.nowPlayingApi,
        {"api_key": "7fdaaf6372fc89fa838bf08fc2a3efa4"});

    try {
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      return NowPlaying.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
