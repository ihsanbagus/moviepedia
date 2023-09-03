import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviepedia/app/core/environment.dart';
import 'package:moviepedia/app/core/utils.dart';
import 'package:moviepedia/app/modules/home/bindings/home_binding.dart';
import 'package:moviepedia/app/modules/home/controllers/home_controller.dart';
import 'package:moviepedia/app/modules/home/models/movie_model.dart';
import 'package:moviepedia/app/modules/home/providers/home_provider.dart';

import 'home_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HomeProvider>()])
void main() {
  late final HomeController c;
  final HomeProvider p = MockHomeProvider();

  final binder = BindingsBuilder(() {
    HomeBinding().dependencies();
    Get.lazyPut(
      () => HomeController(movieProvider: p),
    );
  });
  setUpAll(() {
    binder.builder();
    c = Get.find<HomeController>();
    p.onInit();
  });

  group("home module test", () {
    test("controller initialize test", () {
      expect(c.initialized, true);
    });

    test("controller get now playing test", () async {
      when(p.getMovieByCategory(MovieCategory.nowPlaying)).thenAnswer(
          (_) async => await Future.value(MovieModel(totalResults: 11)));
      await c.getNowPlaying();
      expect(c.nowPlaying.value.totalResults, 11);
    });

    test("controller get popular test", () async {
      when(p.getMovieByCategory(MovieCategory.popular)).thenAnswer(
          (_) async => await Future.value(MovieModel(totalResults: 11)));
      await c.getPopular();
      expect(c.popular.value.totalResults, 11);
    });

    test("controller get top rated test", () async {
      when(p.getMovieByCategory(MovieCategory.topRated)).thenAnswer(
          (_) async => await Future.value(MovieModel(totalResults: 11)));
      await c.getTopRated();
      expect(c.topRated.value.totalResults, 11);
    });
  });

  tearDownAll(() {
    Get.delete<HomeController>();
  });
}
