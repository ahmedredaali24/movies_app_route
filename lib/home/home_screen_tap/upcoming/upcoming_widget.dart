import 'package:flutter/material.dart';

import '../../../model/UpcomingResponse.dart';
import '../../../my_theme.dart';
import '../movies_detailes/movie_details_screen.dart';
import 'movie_item.dart';

class UpcomingWidget extends StatelessWidget {
  final List<ResultsUpcoming> resultsUpcomingList;
  final Function pagination;

  const UpcomingWidget(
      {super.key, required this.resultsUpcomingList, required this.pagination});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.blackContainerColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .245,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      padding: const EdgeInsets.only(left: 5, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "New Releases ",
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
                itemCount: resultsUpcomingList.length + 1,
                itemBuilder: (context, index) {
                  if (index == resultsUpcomingList.length) {
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
                                moveId: resultsUpcomingList[index].id ?? 0,
                              ),
                            ));
                      },
                      child: MovieItem(
                        resultsUpcoming: resultsUpcomingList[index],
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
