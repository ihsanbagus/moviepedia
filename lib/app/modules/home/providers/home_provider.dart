import 'package:get/get.dart';
import 'package:moviepedia/app/core/environment.dart';
import 'package:moviepedia/app/core/utils.dart';
import 'package:moviepedia/app/modules/home/models/movie_model.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return MovieModel.fromJson(map);
      if (map is List) {
        return map.map((item) => MovieModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = baseUrl;
  }

  Future<MovieModel?> getMovieByCategory(MovieCategory mc) async {
    final response = await get(
      'movie/${mc.alias}?api_key=$apiKey',
    );
    return response.body;
  }
}
