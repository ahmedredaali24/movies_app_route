import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/watch_list_screen_tap/watch_list_items.dart';

import '../../firebase.dart';
import '../../model/watch_list.dart';
import '../home_screen_tap/movies_detailes/movie_details_screen.dart';

class WatchListTap extends StatelessWidget {
  const WatchListTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Watchlist',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: StreamBuilder<QuerySnapshot<WatchList>>(
        stream: FirebaseUtils.getMoviesListCollection().snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          List<WatchList> watchListItems =
              snapshot.data!.docs.map((doc) => doc.data()).toList();

          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 2,
              );
            },
            itemCount: watchListItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                            moveId: watchListItems[index].idMovie ?? 0),
                      ));
                },
                child: Dismissible(
                  onResize: () {
                    FirebaseUtils.delet(watchListItems[index]);
                  },
                  key: Key("$index"),
                  child: WatchListItems(
                    watchList: watchListItems[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
