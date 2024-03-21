import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/recommended/recommended_widget.dart';

import '../../../api/recommended_api_manger.dart';
import '../../../model/RecommendedResponse.dart';
import '../../../my_theme.dart';

class FutureRecommended extends StatefulWidget {
  const FutureRecommended({super.key});

  @override
  State<FutureRecommended> createState() => _FutureRecommendedState();
}

class _FutureRecommendedState extends State<FutureRecommended> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecommendedResponse?>(
        future: RecommendedApiManger.getRecommendedResponse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.yellowColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("error"),
                MaterialButton(
                  onPressed: () {
                    RecommendedApiManger.getRecommendedResponse();
                    setState(() {});
                  },
                  child: Text("reload"),
                )
              ],
            );
          } else if (snapshot.data?.success == false) {
            return Column(
              children: [
                Text(
                  snapshot.data?.statusMessage ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                MaterialButton(
                  onPressed: () {
                    RecommendedApiManger.getRecommendedResponse();
                    setState(() {});
                  },
                  child: Text("reload"),
                )
              ],
            );
          }
          var recommendedList = snapshot.data?.results ?? [];
          return InkWell(child: RecommendedWidget(resultsRecommendedList: recommendedList));
        });
  }
}
