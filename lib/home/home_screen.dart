import 'package:flutter/material.dart';
import 'package:movies_app/home/search_screen-tap/search_tap.dart';
import 'package:movies_app/home/watch_list_screen_tap/watch_list_tap.dart';

import 'browse_screen_tap/browse_tap.dart';
import 'home_screen_tap/home_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          iconSize: 35,
          showUnselectedLabels: true,
          // backgroundColor: Colors.green,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/Home icon.png")),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage("assets/icons/Icon material-movie.png")),
                label: "Browse"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage("assets/icons/Icon ionic-md-bookmarks.png")),
                label: "WatchList"),
          ],
        ),
      ),
      body: listTap[selectedIndex],
    );
  }

  List<Widget> listTap = [
    const HomeTap(),
    const SearchTap(),
    BrowseTap(),
    const WatchListTap()
  ];
}
