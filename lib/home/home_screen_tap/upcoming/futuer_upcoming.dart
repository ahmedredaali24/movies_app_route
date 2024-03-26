import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/upcoming/upcoming_widget.dart';

import '../../../api/upcoming_api_manger.dart';
import '../../../model/UpcomingResponse.dart';
import '../../../my_theme.dart';

class FutureUpcoming extends StatefulWidget {
  const FutureUpcoming({super.key});

  @override
  State<FutureUpcoming> createState() => _FutureUpcomingState();
}

class _FutureUpcomingState extends State<FutureUpcoming> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingResponse?>(
        future: UpcomingApiManger.getUpcomingResponse(page: currentPage),
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
                  Text(
                    "error",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  MaterialButton(
                    onPressed: () {
                      UpcomingApiManger.getUpcomingResponse();
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
                      UpcomingApiManger.getUpcomingResponse();
                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          }
          var upcomingList = snapshot.data?.results ?? [];
          return UpcomingWidget(
            pagination: loadNewPage,
            resultsUpcomingList: upcomingList,
          );
        });
  }

  void loadNewPage() {
    currentPage++;
    setState(() {});
  }
}
