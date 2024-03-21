import 'package:flutter/material.dart';
import 'package:movies_app/api/movie_detail_api.dart';
import 'package:movies_app/api/search_api.dart';
import 'package:movies_app/home/search_screen-tap/search_item.dart';
import 'package:movies_app/model/SearchMovie.dart';
import 'package:movies_app/my_theme.dart';

import '../movie_details/movie_details.dart';

class SearchTap extends StatefulWidget {
  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  String query = '';

  List<Results> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    query = text;
                    SearchApi.searchMovie(query).then((value) {
                      results = value.results ?? [];
                      setState(() {});
                    });
                  } else {
                    results = [];
                    setState(() {});
                  }
                },
                onFieldSubmitted: (text) {
                  if (text.isNotEmpty) {
                    query = text;
                    SearchApi.searchMovie(query).then((value) {
                      results = value.results ?? [];
                      setState(() {});
                    });
                  } else {
                    results = [];
                    setState(() {});
                  }
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: Color(0xffFFFFFF),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: MyTheme.whiteColor,
                    ),
                    fillColor: const Color(0xff514F4F),
                    filled: true),
              ),
              if (results.isEmpty)
                Expanded(
                  child: Column(
                    children: [
                      const Spacer(),
                      Image.asset('assets/icons/noMoviesFound.png'),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'No movies found',
                        style: TextStyle(color: MyTheme.whiteColor),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              if (results.isNotEmpty)
                Expanded(
                  child: FutureBuilder<SearchMovieModel>(
                    future:  SearchApi.searchMovie(query),
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
                                    SearchApi.searchMovie(query);
                                  },
                                  child: const Text('Try Again'))
                            ],
                          ),
                        );
                      }
                      var searchList = snapshot.data?.results ?? [];
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              Navigator.of(context).pushNamed(
                                MovieDetails.routeName,
                                arguments: await MovieApiDetail.getMovieDetails(
                                    searchList[index].id ?? 0),
                              );
                            },
                            child: SearchItem(
                              image: searchList[index].posterPath ?? '',
                              title: searchList[index].title ?? '',
                              date: searchList[index].releaseDate ?? '',
                              content: searchList[index].overview ?? '',
                            ),
                          );
                        },
                        itemCount: searchList.length,
                        separatorBuilder: (context, index) =>
                            Divider(color: MyTheme.greyColor, thickness: 1),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
