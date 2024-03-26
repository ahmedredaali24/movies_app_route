import 'package:flutter/material.dart';

import '../../../api/movie_discover_api_manger.dart';
import '../../../model/MovieDiscoverResponse.dart';
import '../../../my_theme.dart';
import 'movies_dscover_widget.dart';

class MovieDiscoverScreen extends StatefulWidget {
  final int movieListId;
  final String? name;

  const MovieDiscoverScreen(
      {super.key, required this.movieListId, required this.name});

  @override
  State<MovieDiscoverScreen> createState() => _MovieDiscoverScreenState();
}

class _MovieDiscoverScreenState extends State<MovieDiscoverScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyTheme.whiteColor,
        title: Text(
          "${widget.name}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder<MovieDiscoverResponse?>(
        future:
            MovieDiscoverApiManger.getMoviesDiscoverResponse(page: currentPage),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.yellowColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("error", style: Theme.of(context).textTheme.titleSmall),
                  MaterialButton(
                    onPressed: () {
                      MovieDiscoverApiManger.getMoviesDiscoverResponse();

                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          } else if (snapshot.data?.success == false) {
            return Column(
              children: [
                Text(
                  snapshot.data?.statusMessage ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                MaterialButton(
                  onPressed: () {
                    MovieDiscoverApiManger.getMoviesDiscoverResponse();
                    setState(() {});
                  },
                  child: Text("reload",
                      style: Theme.of(context).textTheme.titleSmall),
                )
              ],
            );
          }
          var movieDiscoverList = snapshot.data?.results ?? [];

          return MovieDiscoverItems(
            pagination: loadNewPage,
            id: widget.movieListId,
            resultsDiscover: movieDiscoverList,
          );
        },
      ),
    );
  }

  void loadNewPage() {
    currentPage++;
    setState(() {});
  }
}
