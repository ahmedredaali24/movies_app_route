import 'package:flutter/material.dart';

import '../../custom_widgets/clip_rrect_widget.dart';
import '../../model/watch_list.dart';
import '../../my_theme.dart';

class WatchListItems extends StatelessWidget {
  final WatchList watchList;

  const WatchListItems({super.key, required this.watchList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ClipRRectWidget(
                        imagePath:
                            'https://image.tmdb.org/t/p/w500${watchList.image}',
                        boxFit: BoxFit.fill,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchList.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  watchList.date ?? "",
                  style: TextStyle(color: MyTheme.greyColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  watchList.content ?? '',
                  style: TextStyle(color: MyTheme.greyColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
