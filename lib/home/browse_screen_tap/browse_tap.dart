import 'package:flutter/material.dart';
import 'package:movies_app/api/genres_movie_api.dart';
import 'package:movies_app/home/browse_screen_tap/browse_widget_list.dart';
import 'package:movies_app/model/GenresMovieModel.dart';
import 'package:movies_app/my_theme.dart';

class BrowseTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Browse Category ',
          style: TextStyle(
            color: MyTheme.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<GenresMovieModel>(
        future: GenresMovieApi.getGenresMovie(),
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
                        GenresMovieApi.getGenresMovie();
                      },
                      child: const Text('Try Again'))
                ],
              ),
            );
          }
          var genreList = snapshot.data?.genres ?? [];
          return Padding(
            padding: const EdgeInsets.all(25),
            child: GridView.builder(
              itemCount: genreList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Navigator.of(context).pushNamed(BrowseListWidget.routeName,
                        arguments: genreList[index]);
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/icons/bg3.jpg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .07,
                        left: MediaQuery.of(context).size.width * .1,
                        child: Text(
                          '${genreList[index].name}',
                          style: TextStyle(
                            color: MyTheme.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
