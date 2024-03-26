import 'package:flutter/material.dart';

import '../../../model/MovieDetails.dart';

class GenresContainer extends StatelessWidget {
  final Genres genres;

  const GenresContainer({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Text(
        genres.name ?? "",
        style: const TextStyle(
          color: Color(0xffCBCBCB),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}
