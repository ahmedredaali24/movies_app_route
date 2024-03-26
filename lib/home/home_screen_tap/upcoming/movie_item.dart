import 'package:flutter/material.dart';

import '../../../custom_widgets/clip_rrect_widget.dart';
import '../../../custom_widgets/container_add_watch_list.dart';
import '../../../model/UpcomingResponse.dart';

class MovieItem extends StatelessWidget {
  final ResultsUpcoming resultsUpcoming;

  const MovieItem({super.key, required this.resultsUpcoming});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Stack(
        children: [
          ClipRRectWidget(
              imagePath:
                  "https://image.tmdb.org/t/p/w500${resultsUpcoming.posterPath ?? ""}",
              boxFit: BoxFit.fill),
          AddWatchList(
            id: resultsUpcoming.id,
            title: resultsUpcoming.title,
            date: resultsUpcoming.releaseDate,
            content: resultsUpcoming.originalLanguage,
            image: resultsUpcoming.posterPath,
            // imagePath: "assets/images/bookmark.png",
          )
        ],
      ),
    );
  }
}
