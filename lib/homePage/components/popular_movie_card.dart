import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:movie_app/model/movie.dart';

class PopularMovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  const PopularMovieCard({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(movie.thumbnail), fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: movie.moviePlatform == MoviePlatform.netflix
                          ? Colors.black
                          : Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      movie.moviePlatform == MoviePlatform.netflix
                          ? Image.asset('assets/netflix.png', height: 30)
                          : Image.asset('assets/paramount.png', height: 20),
                      const SizedBox(width: 5),
                      badges.Badge(
                        badgeAnimation:
                            const badges.BadgeAnimation.fade(toAnimate: false),
                        badgeContent: const Icon(
                          Icons.check,
                          color: Colors.black,
                          size: 10,
                        ),
                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.twitter,
                          badgeColor:
                              movie.moviePlatform == MoviePlatform.netflix
                                  ? Colors.white
                                  : Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movie.name,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 20),
          ),
          Text(
            movie.movieType,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}
