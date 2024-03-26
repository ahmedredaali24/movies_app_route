import 'package:flutter/material.dart';

import '../../api/movie_list_api_manger.dart';
import '../../model/MovieListResponse.dart';
import '../../my_theme.dart';
import 'movies_disover/movie_discover_screen.dart';

class FutureMoviesList extends StatefulWidget {
  const FutureMoviesList({super.key});

  @override
  State<FutureMoviesList> createState() => _FutureMoviesListState();
}

class _FutureMoviesListState extends State<FutureMoviesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieListResponse?>(
        future: MovieListApiManger.getMoviesListResponse(),
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
                      MovieListApiManger.getMoviesListResponse();
                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          } else if (snapshot.data?.success == false) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data?.statusMessage ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  MaterialButton(
                    onPressed: () {
                      MovieListApiManger.getMoviesListResponse();
                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          }
          var moviesListList = snapshot.data?.genres ?? [];
          return GridView.builder(
              itemCount: moviesListList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDiscoverScreen(
                            name: moviesListList[index].name ?? "",
                            movieListId: moviesListList[index].id ?? 0,
                          ),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/img.png",
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * .05,
                            left: MediaQuery.of(context).size.width * .15,
                            child: Text(
                              "${moviesListList[index].name}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ))
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
