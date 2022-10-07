import 'package:daytona_ssignment/utils/client.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    
  }
}
