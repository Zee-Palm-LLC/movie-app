import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/homePage/components/custom_icon.dart';
import 'package:movie_app/model/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
   MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: const CustomIcons(
              icon: Icons.arrow_back_ios_new,
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: Get.height / 2,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(movie.thumbnail), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Get.height / 2,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text("Watch trailer",
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 10),
                      Container(height: 2, width: 85, color: Colors.white),
                      const SizedBox(height: 10),
                      Text(
                        movie.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '2022-...',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '45min/episode',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'for Teenages',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      offset: Offset(0, 3),
                                    ),
                                    BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      offset: Offset(3, 0),
                                    ),
                                  ]),
                              child: Row(
                                children: const [
                                  Spacer(),
                                  Text(
                                    "Watch on Netflix",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Icon(
                                  Icons.star_purple500_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemCount: tags.length,
                            padding: const EdgeInsets.only(left: 24),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (contex, index) {
                              return Chip(
                                label: Text(
                                  tags[index],
                                  style:const  TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 3,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    ),
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 3,
                      spreadRadius: 5,
                      offset: Offset(3, 0),
                    ),
                  ]),
              child: Icon(Icons.play_arrow, color: Colors.white, size: 40),
            ),
          )
        ],
      ),
    );
  }
  List<String> tags= [ 'Netflix','Trending Now','Teenage Series',
  'action',
  "adventure",
  'comedy',
  'drama',
  'fantasy'
  
  ];
}
