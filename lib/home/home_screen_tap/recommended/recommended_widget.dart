import 'package:flutter/material.dart';

import '../../../model/RecommendedResponse.dart';
import '../../../my_theme.dart';
import '../movies_detailes/movie_details_screen.dart';
import 'movie_recommended_item.dart';

class RecommendedWidget extends StatelessWidget {
  final List<ResultsRecommended> resultsRecommendedList;
  final Function pagination;

  const RecommendedWidget(
      {super.key,
      required this.resultsRecommendedList,
      required this.pagination});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.blackContainerColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.only(left: 5, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Recommended ",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: MyTheme.whiteColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: resultsRecommendedList.length + 1,
                itemBuilder: (context, index) {
                  if (index == resultsRecommendedList.length) {
                    return IconButton(
                      iconSize: 45,
                      color: MyTheme.yellowColor,
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.navigate_next_sharp),
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
                                moveId: resultsRecommendedList[index].id ?? 0,
                              ),
                            ));
                      },
                      child: MovieRecommendedItem(
                        resultsRecommended: resultsRecommendedList[index],
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
