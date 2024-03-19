import 'package:flutter/material.dart';
import 'package:movies_app/my_theme.dart';

import '../../../model/RecommendedResponse.dart';
import 'movie_recommended_item.dart';

class RecommendedWidget extends StatelessWidget {
  final List<ResultsRecommended> resultsRecommendedList;

  const RecommendedWidget({super.key, required this.resultsRecommendedList});

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
            "Recommended ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: resultsRecommendedList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return MovieRecommendedItem(
                    resultsRecommended: resultsRecommendedList[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
