import 'package:daytona_ssignment/feature/details_page/data/details_repo_impl.dart';
import 'package:daytona_ssignment/feature/details_page/details_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsRepoImpl(Get.find()));
    Get.lazyPut(() => DetailsController(Get.find<DetailsRepoImpl>()));
  }
}
