import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/my_theme.dart';

import '../../../model/PopularResponse.dart';

class PopularWidget extends StatelessWidget {
  final Results results;

  const PopularWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: "https://image.tmdb.org/t/p/w500${results.posterPath ?? ""}",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
        placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
          backgroundColor: MyTheme.yellowColor,
        )),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
// "https://image.tmdb.org/t/p/w500${results.posterPath ?? ""}"),
