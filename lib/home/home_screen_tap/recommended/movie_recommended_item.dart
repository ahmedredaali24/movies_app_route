import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/RecommendedResponse.dart';
import '../../../my_theme.dart';

class MovieRecommendedItem extends StatelessWidget {
  final ResultsRecommended resultsRecommended;

  const MovieRecommendedItem({super.key, required this.resultsRecommended});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl:
            "https://image.tmdb.org/t/p/w500${resultsRecommended.posterPath ?? ""}",
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
