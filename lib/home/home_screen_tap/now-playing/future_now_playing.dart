import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../api/now_playing_api_manger.dart';
import '../../../api/popular_api_manger.dart';
import '../../../model/NowPlaying.dart';
import '../../../my_theme.dart';
import 'now_playing_widget.dart';

class FuturePopular extends StatefulWidget {
  const FuturePopular({super.key});

  @override
  State<FuturePopular> createState() => _FuturePopularState();
}

class _FuturePopularState extends State<FuturePopular> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NowPlaying?>(
      future: NowPlayingApiManger.getNowPlayingResponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Container(
            color: MyTheme.blackContainerColor,
          ));
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("error", style: Theme.of(context).textTheme.titleSmall),
                MaterialButton(
                  onPressed: () {
                    PopularApiManger.getPopularResponse();
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
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                MaterialButton(
                  onPressed: () {
                    PopularApiManger.getPopularResponse();
                    setState(() {});
                  },
                  child: Text("reload",
                      style: Theme.of(context).textTheme.titleSmall),
                )
              ],
            ),
          );
        }
        var nowPlayingList = snapshot.data?.results ?? [];
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .3,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
          itemCount: nowPlayingList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return NowPlayingWidget(
              nowPlayingListResults: nowPlayingList[itemIndex],
            );
          },
        );
      },
    );
  }
}
