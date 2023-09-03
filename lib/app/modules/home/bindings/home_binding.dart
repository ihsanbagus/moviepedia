import 'package:get/get.dart';
import 'package:moviepedia/app/modules/home/providers/home_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(movieProvider: HomeProvider()),
    );
  }
}
