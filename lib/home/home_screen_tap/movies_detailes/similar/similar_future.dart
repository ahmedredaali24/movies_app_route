import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/movies_detailes/similar/similar_widget.dart';

import '../../../../api/similar_api_manger.dart';
import '../../../../model/SimilarResponse.dart';
import '../../../../my_theme.dart';

class SimilarFuture extends StatefulWidget {
  final int moveId;

  const SimilarFuture({super.key, required this.moveId});

  @override
  State<SimilarFuture> createState() => _SimilarFutureState();
}

class _SimilarFutureState extends State<SimilarFuture> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SimilarResponse?>(
        future: SimilarApiManger.getSimilarResponse(widget.moveId,
            page: currentPage),
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
                      SimilarApiManger.getSimilarResponse(widget.moveId);
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
                      SimilarApiManger.getSimilarResponse(widget.moveId);
                      setState(() {});
                    },
                    child: Text("reload",
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ],
              ),
            );
          }
          var similarList = snapshot.data?.results ?? [];
          return SimilarWidget(
            pagination: loadNewPage,
            resultsSimilarList: similarList,
          );
        });
  }

  void loadNewPage() {
    currentPage++;
    setState(() {});
  }
}
