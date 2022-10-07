import 'package:daytona_ssignment/feature/home_page/data/home_repo_impl.dart';
import 'package:daytona_ssignment/feature/home_page/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepoImpl(Get.find()));
    Get.lazyPut(() => HomeController(Get.find<HomeRepoImpl>()));
  }
}
