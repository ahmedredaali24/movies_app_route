import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../custom_widgets/clip_rrect_widget.dart';
import '../../../custom_widgets/container_add_watch_list.dart';
import '../../../custom_widgets/play_icon.dart';
import '../../../model/NowPlaying.dart';
import '../../../my_theme.dart';
import '../movies_detailes/movie_details_screen.dart';
import 'now_playing_item.dart';

class NowPlayingWidget extends StatelessWidget {
  final NowPlayingListResults nowPlayingListResults;

  const NowPlayingWidget({super.key, required this.nowPlayingListResults});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              moveId: nowPlayingListResults.id ?? 0,
                            ),
                          ));
                    },
                    child: Stack(
                      children: [
                        NowPlayingItems(
                          results: nowPlayingListResults,
                        ),
                        //
                        PlayIcon(
                            top: MediaQuery.of(context).size.height * .06,
                            left: MediaQuery.of(context).size.width * .4)
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .35),
                child: Column(
                  children: [
                    Text(
                      " ${nowPlayingListResults.title ?? " "}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 15, color: MyTheme.whiteColor),
                    ),
                    Text(
                      // popularList[itemIndex].originalTitle ?? ""
                      DateFormat.y().format(DateTime.parse(
                          nowPlayingListResults.releaseDate ?? "")),

                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * .11,
              left: MediaQuery.of(context).size.width * .03,
              child: Stack(
                children: [
                  ClipRRectWidget(
                    boxFit: BoxFit.fill,
                    imagePath:
                        "https://image.tmdb.org/t/p/w500${nowPlayingListResults.posterPath ?? ""}",
                  ),
                  AddWatchList(
                    id: nowPlayingListResults.id,
                    title: nowPlayingListResults.title,
                    date: nowPlayingListResults.releaseDate,
                    content: nowPlayingListResults.originalLanguage,
                    image: nowPlayingListResults.posterPath,
                    // imagePath: "assets/images/bookmark.png",
                  )
                ],
              )),
        ],
      ),
    );
  }
}
