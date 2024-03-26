import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../my_theme.dart';

class ClipRRectWidget extends StatelessWidget {
  final String imagePath;
  final BoxFit boxFit;

  const ClipRRectWidget(
      {super.key, required this.imagePath, required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        width: MediaQuery.of(context).size.height * .15,
        height: MediaQuery.of(context).size.height * .165,
        fit: boxFit,
        placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
          backgroundColor: MyTheme.yellowColor,
        )),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: MyTheme.yellowColor,
        ),
      ),
    );
  }
}
