import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../custom_widgets/clip_rrect_widget.dart';
import '../../../custom_widgets/container_add_watch_list.dart';
import '../../../model/RecommendedResponse.dart';
import '../../../my_theme.dart';

class MovieRecommendedItem extends StatefulWidget {
  final ResultsRecommended resultsRecommended;

  const MovieRecommendedItem({
    super.key,
    required this.resultsRecommended,
  });

  @override
  State<MovieRecommendedItem> createState() => _MovieRecommendedItemState();
}

bool? isb;

class _MovieRecommendedItemState extends State<MovieRecommendedItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRectWidget(
                    boxFit: BoxFit.fill,
                    imagePath:
                        "https://image.tmdb.org/t/p/w500${widget.resultsRecommended.posterPath ?? ""}",
                  ),
                  AddWatchList(
                    // imagePath: "assets/images/bookmark.png",
                    id: widget.resultsRecommended.id,
                    title: widget.resultsRecommended.title,
                    date: widget.resultsRecommended.releaseDate,
                    content: widget.resultsRecommended.originalLanguage,
                    image: widget.resultsRecommended.posterPath,
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: MyTheme.yellowColor,
                  ),
                  Text(
                    "${widget.resultsRecommended.voteAverage ?? "0"}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 10),
                  )
                ],
              ),
              Center(
                  child: Text(
                widget.resultsRecommended.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )),
              Text(
                  DateFormat.y().format(DateTime.parse(
                    widget.resultsRecommended.releaseDate ?? "",
                  )),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 10, color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
