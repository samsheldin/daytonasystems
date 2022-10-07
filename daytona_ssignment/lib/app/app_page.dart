import 'package:daytona_ssignment/feature/home_page/home_bindings.dart';
import 'package:daytona_ssignment/feature/home_page/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class RouteName {
  static const String home = "/home";
  static const String countryDetails = "/countryDetails";
}

abstract class GetPages {
  static List<GetPage> get getPages => [
        GetPage(
            name: RouteName.home,
            page: () => const HomePage(),
            binding: HomeBindings())
      ];
}
