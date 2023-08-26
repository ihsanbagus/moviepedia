import 'package:get/get.dart';
import 'package:moviepedia/app/core/environment.dart';
import 'package:moviepedia/app/modules/detail/models/detail_model.dart';

class DetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return DetailModel.fromJson(map);
      if (map is List) {
        return map.map((item) => DetailModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = baseUrl;
  }

  Future<DetailModel?> getDetailMovie(String? id) async {
    final response = await get(
      'movie/$id?api_key=$apiKey',
    );
    return response.body;
  }
}
