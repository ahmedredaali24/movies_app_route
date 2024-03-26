import 'package:flutter/cupertino.dart';

import 'firebase.dart';
import 'model/watch_list.dart';

class WatchListProvider extends ChangeNotifier {
  bool? _isDone = false;

  bool? get isDone => _isDone;

  void updateIsDoneStatus(int? id, bool value) {
    _isDone = value;
    notifyListeners();
  }

  void addMovieToWatchList(
      int id, String title, String content, String image, String date) {
    WatchList watchList = WatchList(
        isDone: _isDone ?? false,
        idMovie: id,
        title: title,
        content: content,
        image: image,
        date: date);
    FirebaseUtils.addMoviesToFireStore(watchList).catchError((error) {
      print('Error: Cannot save it');
    });
  }
}
