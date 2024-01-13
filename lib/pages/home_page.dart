import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/controllers/movie_controller.dart';
import 'package:video_player/controllers/top_rated_controller.dart';
import 'package:video_player/controllers/tv_controller.dart';
import 'package:video_player/widgets/movie.dart';
import 'package:video_player/widgets/toprated.dart';
import 'package:video_player/widgets/tv.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.find();
    final TopRatedController topRatedController = Get.find();
    final TVController tvController = Get.find();

    return Scaffold(
      body: ListView(
        children: [
          TopRated(toprated: topRatedController.topRatedMovies),
          Movie(movielist: movieController.movies),
          TV(tv: tvController.tvShows),
        ],
      ),
    );
  }
}
