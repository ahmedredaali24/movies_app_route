import 'package:flutter/material.dart';

import '../firebase.dart';
import '../model/watch_list.dart';
import '../my_theme.dart';

class AddWatchList extends StatefulWidget {
  int? id;
  String? title;
  String? content;
  String? image;
  String? date;
  bool? isDone;

  AddWatchList(
      {super.key, this.content, this.title, this.image, this.date, this.id});

  @override
  State<AddWatchList> createState() => _AddWatchListState();
}

class _AddWatchListState extends State<AddWatchList> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!isClicked) {
            isClicked = true;
            addMovieToWatchList(
              context,
              date: widget.date ?? "",
              id: widget.id ?? 0,
              image: widget.image ?? '',
              title: widget.title ?? "",
              content: widget.content ?? '',
            );
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(isClicked
                    ? "assets/images/bookmark-you.png"
                    : "assets/images/bookmark.png"),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height * 0.045,
        width: MediaQuery.of(context).size.height * 0.03,
        child: Icon(
          isClicked ? Icons.check : Icons.add,
          color: MyTheme.whiteColor,
        ),
      ),
    );
  }

  void addMovieToWatchList(
    BuildContext context, {
    required int id,
    required String title,
    required String content,
    required String image,
    required String date,
  }) {
    WatchList watchList = WatchList(
        isDone: isClicked,
        idMovie: id,
        title: title,
        content: content,
        image: image,
        date: date);
    FirebaseUtils.addMoviesToFireStore(watchList).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(milliseconds: 500),
            content: Text('Saved to watchlist')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Cannot save it')),
      );
    });
  }
}
