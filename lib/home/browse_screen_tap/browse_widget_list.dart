import 'package:flutter/material.dart';
import 'package:movies_app/api/movie_detail_api.dart';
import 'package:movies_app/home/browse_screen_tap/browse_item.dart';
import 'package:movies_app/home/movie_details/movie_details.dart';
import 'package:movies_app/model/GenreMovieDetails.dart';
import 'package:movies_app/my_theme.dart';

import '../../api/genres_movie_details_api.dart';
import '../../model/GenresMovieModel.dart';

class BrowseListWidget extends StatelessWidget {
  static const String routeName = 'browse_widget';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '${args.name} List',
          style: TextStyle(
            color: MyTheme.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder<GenreMovieDetails>(
        future: GenresMovieDetailsApi.genresMovieDetails(args.id ?? 0),
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
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                      onPressed: () {
                        GenresMovieDetailsApi.genresMovieDetails(args.id ?? 0);
                      },
                      child: const Text('Try Again'))
                ],
              ),
            );
          }
          var genreListDetails = snapshot.data?.results ?? [];
          return ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  Navigator.of(context).pushNamed(
                    MovieDetails.routeName,
                    arguments: await MovieApiDetail.getMovieDetails(
                        genreListDetails[index].id ?? 0),
                  );
                },
                child: BrowseItem(
                  image: genreListDetails[index].backdropPath ?? '',
                  title: genreListDetails[index].title ?? '',
                  date: genreListDetails[index].releaseDate ?? '',
                  content: genreListDetails[index].overview ?? '',
                ),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(color: MyTheme.greyColor, thickness: 1),
            itemCount: genreListDetails.length,
          );
        },
      ),
    );
  }
}
