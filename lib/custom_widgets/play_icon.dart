import 'package:flutter/material.dart';

import '../my_theme.dart';

class PlayIcon extends StatelessWidget {
  final double top;
  final double left;

  const PlayIcon({super.key, required this.top, required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Icon(
        Icons.play_circle_fill,
        size: 80,
        color: MyTheme.whiteColor,
      ),
    );
  }
}
// top: MediaQuery.of(context).size.height * .06,
// left: MediaQuery.of(context).size.width * .4
