import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../api/popular_api_manger.dart';
import '../../../model/PopularResponse.dart';
import '../../../my_theme.dart';
import 'PopularWidget.dart';

class FuturePopular extends StatefulWidget {
  const FuturePopular({super.key});

  @override
  State<FuturePopular> createState() => _FuturePopularState();
}

class _FuturePopularState extends State<FuturePopular> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularResponse?>(
      future: PopularApiManger.getPopularResponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.yellowColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("error"),
              MaterialButton(
                onPressed: () {
                  PopularApiManger.getPopularResponse();
                  setState(() {});
                },
                child: Text("reload"),
              )
            ],
          );
        } else if (snapshot.data?.success == false) {
          return Center(
            child: Column(
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
                  child: Text("reload"),
                )
              ],
            ),
          );
        }
        var popularList = snapshot.data?.results ?? [];
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .4,
            aspectRatio: 16 / 9,
            viewportFraction: .8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
          itemCount: popularList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PopularWidget(
                    results: popularList[itemIndex],
                  ),
                ),
                Text(
                  popularList[itemIndex].name ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  popularList[itemIndex].firstAirDate ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
