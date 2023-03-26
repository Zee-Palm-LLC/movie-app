import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/detailPage/movie_detail_page.dart';
import 'package:movie_app/model/movie.dart';
import 'components/custom_icon.dart';
import 'components/popular_movie_card.dart';
import 'components/suggested_movie_card.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomIcons(
            icon: Icons.search,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "All Series",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        actions: const [
          CustomIcons(
            icon: Icons.graphic_eq_rounded,
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text("Popular Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 280,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 24),
                      itemBuilder: (context, index) {
                        return PopularMovieCard(
                          movie: moviesList[index],
                          onTap: () {
                            Get.to(() =>
                                MovieDetailPage(movie: moviesList[index]));
                          },
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
                      itemCount: moviesList.length),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text("Suggested For You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 24),
                      itemBuilder: (context, index) {
                        return SuggestedMovieCard(
                          movie: moviesList[index],
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
                      itemCount: moviesList.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
