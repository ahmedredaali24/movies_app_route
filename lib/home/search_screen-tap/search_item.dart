import 'package:flutter/material.dart';
import 'package:movies_app/my_theme.dart';

class SearchItem extends StatelessWidget {
  String image;

  String title;

  String date;

  String content;

  SearchItem({
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
                  Image.network(
                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2$image',
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                  Image.asset('assets/icons/bookmark.png'),
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
