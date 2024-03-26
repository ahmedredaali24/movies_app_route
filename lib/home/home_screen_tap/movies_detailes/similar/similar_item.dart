import 'package:flutter/material.dart';

import '../../../../custom_widgets/clip_rrect_widget.dart';
import '../../../../custom_widgets/container_add_watch_list.dart';
import '../../../../model/SimilarResponse.dart';
import '../../../../my_theme.dart';

class SimilarItem extends StatelessWidget {
  final ResultsSimilar? resultsSimilar;

  const SimilarItem({super.key, required this.resultsSimilar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRectWidget(
                    boxFit: BoxFit.cover,
                    imagePath:
                        "https://image.tmdb.org/t/p/w500${resultsSimilar?.posterPath ?? ""}",
                  ),
                  AddWatchList(
                    id: resultsSimilar?.id,
                    title: resultsSimilar?.title,
                    date: resultsSimilar?.releaseDate,
                    content: resultsSimilar?.originalLanguage,
                    image: resultsSimilar?.posterPath,
                    // imagePath: "assets/images/bookmark.png",
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: MyTheme.yellowColor,
                  ),
                  Text(
                    "${resultsSimilar?.voteAverage ?? "0"}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 10),
                  )
                ],
              ),
              Text(
                resultsSimilar?.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              Text(resultsSimilar?.releaseDate ?? "",
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
