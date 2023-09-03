import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviepedia/app/modules/detail/models/detail_model.dart';
import 'package:moviepedia/app/modules/detail/providers/detail_provider.dart';

import 'detail_provider_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetConnect>(),
])
main() {
  late final DetailProvider p;
  final GetConnect g = MockGetConnect();

  setUpAll(() {
    p = DetailProvider();
  });

  test("provider test", () async {
    p.onInit();
    when(g.get<Map>("movie"))
        .thenAnswer((_) => Future.value(const Response(body: {})));
    var data = await p.getDetailMovie("1");
    expect(data?.id, isNull);
  });

  test("model test", () async {
    final m = DetailModel(genreIds: []);
    expect(m.toJson(), isA<Map>());
  });
}
