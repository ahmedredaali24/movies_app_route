import 'package:flutter/material.dart';

import '../../../custom_widgets/clip_rrect_widget.dart';
import '../../../model/NowPlaying.dart';

class NowPlayingItems extends StatelessWidget {
  final NowPlayingListResults results;

  const NowPlayingItems({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRectWidget(
        imagePath: "https://image.tmdb.org/t/p/w500${results.posterPath ?? ""}",
        boxFit: BoxFit.cover,
      ),
    );
  }
}
//
