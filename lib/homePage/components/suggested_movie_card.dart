import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class SuggestedMovieCard extends StatelessWidget {
  final Movie movie;
  const SuggestedMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(movie.thumbnail), fit: BoxFit.fill)),
    );
  }
}
