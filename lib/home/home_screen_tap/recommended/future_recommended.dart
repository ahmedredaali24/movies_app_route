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
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecommendedResponse?>(
        future: RecommendedApiManger.getRecommendedResponse(
            language: "er", page: currentPage),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: MyTheme.blackContainerColor,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("error", style: Theme.of(context).textTheme.titleSmall),
                  MaterialButton(
                    onPressed: () {
                      RecommendedApiManger.getRecommendedResponse();
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
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  MaterialButton(
                    onPressed: () {
                      RecommendedApiManger.getRecommendedResponse();
                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          }
          var recommendedList = snapshot.data?.results ?? [];
          return RecommendedWidget(
              pagination: loadNewPage, resultsRecommendedList: recommendedList);
        });
  }

  void loadNewPage() {
    currentPage++;
    setState(() {});
  }
}
