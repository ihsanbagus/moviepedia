import 'package:get/get.dart';
import 'package:moviepedia/app/core/utils.dart';
import 'package:moviepedia/app/modules/home/models/movie_model.dart';
import 'package:moviepedia/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  final nowPlayingTitle = MovieCategory.nowPlaying.name;
  final popularTitle = MovieCategory.popular.name;
  final topRatedTitle = MovieCategory.topRated.name;
  final movieProvider = Get.find<HomeProvider>();
  final nowPlaying = MovieModel().obs;
  final popular = MovieModel().obs;
  final topRated = MovieModel().obs;

  @override
  void onInit() {
    super.onInit();
    getNowPlaying();
    getPopular();
    getTopRated();
  }

  Future<void> getNowPlaying() async {
    await Future.delayed(const Duration(seconds: 3));
    movieProvider
        .getMovieByCategory(MovieCategory.nowPlaying)
        .then((value) => nowPlaying(value));
  }

  Future<void> getPopular() async {
    await Future.delayed(const Duration(seconds: 4));
    movieProvider
        .getMovieByCategory(MovieCategory.popular)
        .then((value) => popular(value));
  }

  Future<void> getTopRated() async {
    await Future.delayed(const Duration(seconds: 5));
    movieProvider
        .getMovieByCategory(MovieCategory.topRated)
        .then((value) => topRated(value));
  }

  @override
  void onClose() {
    movieProvider.dispose();
    super.onClose();
  }
}
