import 'package:get/get.dart';
import 'package:moviepedia/app/modules/detail/models/detail_model.dart';
import 'package:moviepedia/app/modules/detail/providers/detail_provider.dart';

class DetailController extends GetxController with StateMixin<DetailModel> {
  final DetailProvider detailProvider;

  DetailController({required this.detailProvider});

  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['id'];
    getDetailMovie(id);
  }

  Future<void> getDetailMovie(String? id) async {
    change(null, status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 3));
    detailProvider.getDetailMovie(id).then((v) {
      change(v, status: RxStatus.success());
    }).onError((e, s) {
      change(DetailModel(), status: RxStatus.error());
    });
  }

  @override
  void onClose() {
    detailProvider.dispose();
    super.onClose();
  }
}
