import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen_tap/recommended/future_recommended.dart';
import 'package:movies_app/home/home_screen_tap/upcoming/futuer_upcoming.dart';

import 'now-playing/future_now_playing.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ///popular
          FuturePopular(),

          ///upcoming=>newReleases
          FutureUpcoming(),

          /// recommended
          FutureRecommended(),
        ],
      ),
    );

    // return
  }
}
