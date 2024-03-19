import 'package:flutter/material.dart';
import 'package:movies_app/api/upcoming_api_manger.dart';
import 'package:movies_app/home/home_screen_tap/upcoming/upcoming_widget.dart';
import 'package:movies_app/model/UpcomingResponse.dart';

import '../../../my_theme.dart';

class FutureUpcoming extends StatefulWidget {
  const FutureUpcoming({super.key});

  @override
  State<FutureUpcoming> createState() => _FutureUpcomingState();
}

class _FutureUpcomingState extends State<FutureUpcoming> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingResponse?>(
        future: UpcomingApiManger.getUpcomingResponse(),
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
                    UpcomingApiManger.getUpcomingResponse();
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
                    UpcomingApiManger.getUpcomingResponse();
                    setState(() {});
                  },
                  child: Text("reload"),
                )
              ],
            );
          }
          var upcomingList = snapshot.data?.results ?? [];
          return UpcomingWidget(
            resultsUpcomingList: upcomingList,
          );
        });
  }
}
