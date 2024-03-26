import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/movies_detailes/similar/similar_item.dart';

import '../../../../model/SimilarResponse.dart';
import '../../../../my_theme.dart';
import '../movie_details_screen.dart';

class SimilarWidget extends StatelessWidget {
  final List<ResultsSimilar> resultsSimilarList;
  final Function pagination;

  const SimilarWidget(
      {super.key, required this.resultsSimilarList, required this.pagination});

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
            "More Like this ",
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
                itemCount: resultsSimilarList.length + 1,
                itemBuilder: (context, index) {
                  if (index == resultsSimilarList.length) {
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
                                  moveId: resultsSimilarList[index].id ?? 0,
                                ),
                              ));
                        },
                        child: SimilarItem(
                            resultsSimilar: resultsSimilarList[index]));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
