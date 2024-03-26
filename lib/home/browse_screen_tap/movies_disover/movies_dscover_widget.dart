import 'package:flutter/material.dart';

import '../../../model/MovieDiscoverResponse.dart';
import '../../../my_theme.dart';
import '../../home_screen_tap/movies_detailes/movie_details_screen.dart';
import 'movies_discover_items.dart';

class MovieDiscoverItems extends StatelessWidget {
  final List<ResultsDiscover> resultsDiscover;
  final int id;
  final Function pagination;

  const MovieDiscoverItems(
      {super.key,
      required this.resultsDiscover,
      required this.id,
      required this.pagination});

  @override
  Widget build(BuildContext context) {
    List<ResultsDiscover> filteredResults = resultsDiscover
        .where((element) => element.genreIds!.contains(id))
        .toList();
    return ListView.builder(
        itemCount: filteredResults.length + 1,
        itemBuilder: (context, index) {
          if (index == filteredResults.length) {
            return IconButton(
              iconSize: 45,
              color: MyTheme.yellowColor,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.keyboard_arrow_down_rounded),
                  Text(
                    "more",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
              onPressed: () {
                pagination();
              },
            );
          } else {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                          moveId: filteredResults[index].id ?? 0,
                        ),
                      ));
                },
                child: MoviesDiscoversItemss(
                  resultsDiscover: filteredResults[index],
                ));
          }
        });
  }
}
