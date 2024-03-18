import 'package:flutter/material.dart';
import 'package:movies_app/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  HomeScreen({super.key});

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
    );
  }
}
