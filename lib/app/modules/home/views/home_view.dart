import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviepedia/app/core/environment.dart';
import 'package:moviepedia/app/modules/home/views/widgets/movie_list.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView(
          primary: true,
          physics: const BouncingScrollPhysics(),
          children: [
            MovieList(
              title: controller.nowPlayingTitle,
              movies: controller.nowPlaying.value.results,
            ),
            MovieList(
              title: controller.popularTitle,
              movies: controller.popular.value.results,
            ),
            MovieList(
              title: controller.topRatedTitle,
              movies: controller.topRated.value.results,
            ),
          ],
        );
      }),
    );
  }
}
