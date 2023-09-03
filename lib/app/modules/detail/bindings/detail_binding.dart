import 'package:get/get.dart';
import 'package:moviepedia/app/modules/detail/providers/detail_provider.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailController(detailProvider: DetailProvider()),
    );
  }
}
