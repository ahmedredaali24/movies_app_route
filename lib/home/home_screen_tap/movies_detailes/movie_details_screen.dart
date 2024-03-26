import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/movies_detailes/similar/similar_future.dart';

import '../../../api/movie_details_api_manager.dart';
import '../../../custom_widgets/clip_rrect_widget.dart';
import '../../../custom_widgets/container_add_watch_list.dart';
import '../../../custom_widgets/play_icon.dart';
import '../../../model/MovieDetails.dart';
import '../../../my_theme.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = "Movie Details  ";

  final int moveId;

  const MovieDetailsScreen({super.key, required this.moveId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetails?>(
        future: MovieDetailsApiManger.getMovieDetailsResponse(widget.moveId),
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
                      MovieDetailsApiManger.getMovieDetailsResponse(
                          widget.moveId);
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
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  MaterialButton(
                    onPressed: () {
                      MovieDetailsApiManger.getMovieDetailsResponse(
                          widget.moveId);
                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          }
          var movieDetailsList = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              foregroundColor: MyTheme.whiteColor,
              title: Text(
                movieDetailsList?.title ?? "",
                style: TextStyle(
                  color: MyTheme.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// first poster
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .25,
                        child: ClipRRectWidget(
                          boxFit: BoxFit.cover,
                          imagePath:
                              "https://image.tmdb.org/t/p/w500${movieDetailsList?.posterPath ?? ""}",
                        ),
                      ),
                      PlayIcon(
                        top: MediaQuery.of(context).size.height * .06,
                        left: MediaQuery.of(context).size.width * .4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),

                  ///title
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      movieDetailsList?.title ?? "",
                      style: TextStyle(
                        color: MyTheme.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),

                    ///row date
                    child: Row(
                      children: [
                        Text(
                          "${movieDetailsList?.releaseDate ?? 0}",
                          style: const TextStyle(
                            color: Color(0xffB5B4B4),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .015,
                        ),
                        Text(movieDetailsList?.status ?? "",
                            style: const TextStyle(
                              color: Color(0xffB5B4B4),
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///smallImage
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .3,
                                height: MediaQuery.of(context).size.width * .45,
                                child: ClipRRectWidget(
                                  boxFit: BoxFit.fill,
                                  imagePath:
                                      "https://image.tmdb.org/t/p/w500${movieDetailsList?.posterPath ?? ""}",
                                ),
                              ),
                              AddWatchList(

                                  // imagePath: "assets/images/bookmark.png",
                                  ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),

                          ///genres
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 20,
                                      children: movieDetailsList?.genres
                                              ?.map((genre) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  color: MyTheme.blackColor),
                                              child: Text(genre.name ?? '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                            );
                                          }).toList() ??
                                          [],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .015,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .5,

                                ///overview
                                child: Text(
                                  '${movieDetailsList?.overview}',
                                  maxLines: 5,
                                  style: TextStyle(
                                      color: MyTheme.whiteColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.5,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .015,
                              ),

                              ///vote
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
                                    '${movieDetailsList?.voteAverage}',
                                    style: const TextStyle(
                                      color: Color(0xffCBCBCB),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .025,
                  ),
                  SimilarFuture(
                    moveId: widget.moveId,
                  )
                ],
              ),
            ),
          );
        });
  }
}
