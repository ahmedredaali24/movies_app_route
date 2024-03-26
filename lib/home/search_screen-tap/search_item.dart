import 'package:flutter/material.dart';

import '../../custom_widgets/clip_rrect_widget.dart';
import '../../custom_widgets/container_add_watch_list.dart';
import '../../my_theme.dart';

class SearchItem extends StatelessWidget {
  final String image;

  final String title;

  final String date;

  final String content;

  const SearchItem({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ClipRRectWidget(
                        imagePath: 'https://image.tmdb.org/t/p/w500$image',
                        boxFit: BoxFit.fill,
                      )),
                  AddWatchList(
                    title: title,
                    date: date,
                    content: content,
                    image: image,
                    // imagePath: "assets/images/bookmark.png",
                  )
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
                  title,
                  style: TextStyle(color: MyTheme.whiteColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style: TextStyle(color: MyTheme.whiteColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  content,
                  style: TextStyle(color: MyTheme.whiteColor),
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
