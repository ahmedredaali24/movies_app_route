import 'package:flutter/material.dart';
// import 'package:movies_app/api/get_similar_movie.dart';
// import 'package:movies_app/api/get_similar_movie.dart';
import 'package:movies_app/api/movie_detail_api.dart';
import 'package:movies_app/api/popular_api_manger.dart';
import 'package:movies_app/api/similar_movie_api.dart';
import 'package:movies_app/model/MovieDetail.dart';
import 'package:movies_app/model/SimilarMovie.dart';
import 'package:movies_app/my_theme.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movieDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieDetail;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${args.title}',
          style: TextStyle(
            color: MyTheme.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .25,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2${args.backdropPath}',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .09,
                  left: MediaQuery.of(context).size.width * .4,
                  child: Image.asset('assets/icons/play-button.png'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              '${args.title}',
              style: TextStyle(
                color: MyTheme.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              '${args.releaseDate}',
              style: const TextStyle(
                color: Color(0xffB5B4B4),
                fontWeight: FontWeight.w700,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .33,
                      height: MediaQuery.of(context).size.height * .25,
                      margin: const EdgeInsets.only(left: 22.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${args.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * .055,
                      child: Image.asset('assets/icons/bookmark.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Text(
                            '${args.genres?.elementAt(0).name}',
                            style: const TextStyle(
                              color: Color(0xffCBCBCB),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Text(
                            '${args.genres?.elementAt(1).name}',
                            style: const TextStyle(
                              color: Color(0xffCBCBCB),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        '${args.overview}',
                        maxLines: 5,
                        style: TextStyle(
                            color: MyTheme.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.5,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: MyTheme.yellowColor,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          '${args.voteAverage}',
                          style: const TextStyle(
                            color: Color(0xffCBCBCB),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: MyTheme.blackContainerColor,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'More Like This',
                    style: TextStyle(
                      color: MyTheme.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: FutureBuilder<SimilarMovie>(
                      future:SimilarApiMovie.getSimilarMovie(args.id ?? 0),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                      PopularApiManger.getPopularResponse();
                                    },
                                    child: const Text('Try Again'))
                              ],
                            ),
                          );
                        }
                        var similarList = snapshot.data?.results ?? [];
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                Navigator.of(context).pushNamed(
                                    MovieDetails.routeName,
                                    arguments: await MovieApiDetail.getMovieDetails(
                                        similarList[index].id ?? 0));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff343534),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2${similarList[index].posterPath}',
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                          ),
                                          Image.asset(
                                              'assets/icons/bookmark.png'),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('assets/icons/star.png'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${similarList[index].voteAverage}',
                                          style: TextStyle(
                                            color: MyTheme.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '${similarList[index].title}',
                                      style: TextStyle(
                                        color: MyTheme.whiteColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '${similarList[index].releaseDate}',
                                      style: const TextStyle(
                                        color: Color(0xffB5B4B4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: similarList.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
