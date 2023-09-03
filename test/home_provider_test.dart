import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviepedia/app/core/environment.dart';
import 'package:moviepedia/app/core/utils.dart';
import 'package:moviepedia/app/modules/home/models/movie_model.dart';
import 'package:moviepedia/app/modules/home/providers/home_provider.dart';

import 'home_provider_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetConnect>(),
])
main() {
  late final HomeProvider p;
  final GetConnect g = MockGetConnect();

  setUpAll(() {
    p = HomeProvider();
  });

  test("provider test", () async {
    p.onInit();
    when(g.get<List>("movie"))
        .thenAnswer((_) => Future.value(const Response(body: [])));
    var data = await p.getMovieByCategory(MovieCategory.topRated);
    expect(data?.totalPages, 572);
  });

  test("model test", () async {
    final m = MovieModel(results: []);
    expect(m.toJson(), isA<Map>());

    final r = Results(genreIds: []);
    expect(r.toJson(), isA<Map>());
  });
}
