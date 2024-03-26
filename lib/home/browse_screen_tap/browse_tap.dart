import 'package:flutter/material.dart';
import 'package:movies_app/my_theme.dart';

import 'future_movieslist.dart';

class BrowseTap extends StatelessWidget {
  const BrowseTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Browse Category ',
            style: TextStyle(
              color: MyTheme.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const FutureMoviesList());
  }
}
