//mineeee
import 'package:flutter/material.dart';
import 'package:movies_app/home/browse_screen_tap/browse_widget_list.dart';
import 'package:movies_app/home/movie_details/movie_details.dart';
import 'package:movies_app/my_theme.dart';

import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MovieDetails.routeName: (context) => MovieDetails(),
        BrowseListWidget.routeName: (context) => BrowseListWidget(),
      },
      theme: MyTheme.themeMode,
    );
  }
}
