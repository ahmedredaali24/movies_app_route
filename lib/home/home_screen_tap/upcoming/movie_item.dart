import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/UpcomingResponse.dart';
import '../../../my_theme.dart';

class MovieItem extends StatelessWidget {
  final ResultsUpcoming resultsUpcoming;

  const MovieItem({super.key, required this.resultsUpcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl:
            "https://image.tmdb.org/t/p/w500${resultsUpcoming.posterPath ?? ""}",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
        placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
          backgroundColor: MyTheme.yellowColor,
        )),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ));
  }
}
