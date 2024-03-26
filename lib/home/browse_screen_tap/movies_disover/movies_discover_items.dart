import 'package:flutter/material.dart';

import '../../../custom_widgets/clip_rrect_widget.dart';
import '../../../model/MovieDiscoverResponse.dart';

class MoviesDiscoversItemss extends StatelessWidget {
  final ResultsDiscover resultsDiscover;

  const MoviesDiscoversItemss({super.key, required this.resultsDiscover});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ClipRRectWidget(
                        imagePath:
                            'https://image.tmdb.org/t/p/w500${resultsDiscover.posterPath}',
                        boxFit: BoxFit.fill,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resultsDiscover.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  resultsDiscover.releaseDate ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  resultsDiscover.originalLanguage ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 13, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
