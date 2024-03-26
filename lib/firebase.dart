import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/watch_list.dart';

class FirebaseUtils {
  /// movies collection

  static CollectionReference<WatchList> getMoviesListCollection() {
    return FirebaseFirestore.instance
        .collection(WatchList.collectionName)
        .withConverter<WatchList>(
            fromFirestore: ((snapshot, options) =>
                WatchList.fromJson(snapshot.data()!)),
            toFirestore: (movies, _) => movies.toJson());
  }

  static Future<void> addMoviesToFireStore(WatchList watchList) async {
    var taskCollection = getMoviesListCollection();
    var taskDoc = taskCollection.doc();
    watchList.id = taskDoc.id;
    return taskDoc.set(watchList);
  }

  static updateToTrue(WatchList watchList) {
    return getMoviesListCollection().doc(watchList.id).update({"isDone": true});
  }

  static delet(WatchList watchList) {
    return getMoviesListCollection().doc(watchList.id).delete();
  }
}
