import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/popular/future_popular.dart';
import 'package:movies_app/home/home_screen_tap/recommended/future_recommended.dart';
import 'package:movies_app/home/home_screen_tap/upcoming/futuer_upcoming.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FuturePopular()),
          Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: FutureUpcoming()),
          Container(
              margin: EdgeInsets.symmetric(vertical: 0),
              child: FutureRecommended()),
        ],
      ),
    );

    // return
  }
}
