import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviepedia/app/modules/detail/bindings/detail_binding.dart';
import 'package:moviepedia/app/modules/detail/controllers/detail_controller.dart';
import 'package:moviepedia/app/modules/detail/models/detail_model.dart';
import 'package:moviepedia/app/modules/detail/providers/detail_provider.dart';

import 'detail_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DetailProvider>()])
void main() {
  late final DetailController c;
  final DetailProvider p = MockDetailProvider();

  final binder = BindingsBuilder(() {
    DetailBinding().dependencies();
    Get.lazyPut(
      () => DetailController(detailProvider: p),
    );
  });
  setUpAll(() {
    binder.builder();
    c = Get.find<DetailController>();
  });

  group("detail module test", () {
    test("controller initialize test", () {
      expect(c.initialized, true);
    });

    test("controller get detail test", () async {
      final data = DetailModel.fromJson({
        "adult": false,
        "genre_ids": [],
        "backdrop_path": "",
        "id": 0,
        "original_language": "",
        "original_title": "",
        "overview": "",
        "popularity": 0.0,
        "poster_path": "",
        "release_date": "",
        "title": "",
        "video": false,
        "vote_average": 0.0,
        "vote_count": 0,
      });
      when(p.getDetailMovie("1"))
          .thenAnswer((_) async => await Future.value(data));
      await c.getDetailMovie("1");
      data.toJson();
    });

    test("controller get detail failed test", () async {
      when(p.getDetailMovie("1"))
          .thenAnswer((_) async => await Future.value(null));
      await c.getDetailMovie("2");
    });
  });

  tearDownAll(() {
    Get.delete<DetailController>();
  });
}
