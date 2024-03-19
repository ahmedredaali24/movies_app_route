import 'package:flutter/material.dart';
import 'package:movies_app/my_theme.dart';

import '../../../model/UpcomingResponse.dart';
import 'movie_item.dart';

class UpcomingWidget extends StatelessWidget {
  final List<ResultsUpcoming> resultsUpcomingList;

  const UpcomingWidget({super.key, required this.resultsUpcomingList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 190,
      color: MyTheme.blackContainerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "New Releases ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: resultsUpcomingList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return MovieItem(
                    resultsUpcoming: resultsUpcomingList[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
