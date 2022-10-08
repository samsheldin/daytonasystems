import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:daytona_ssignment/feature/home_page/domain/home_repo.dart';
import 'package:get/get.dart';

import 'data/models/countries_model.dart';

class HomeController extends GetxController {
  final HomeRepo _homeRepo;
  HomeController(this._homeRepo);
  bool isLoading = false;
  bool isLoaded = false;
  bool isError = false;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  List<String> countries = [];
  _changeStatus(bool loading, bool loaded, bool error) {
    isLoading = loading;
    isLoaded = loaded;
    isError = error;
    update();
  }

  Map<String, dynamic> flagKeys = {};

  void fetchData() async {
    _changeStatus(true, false, false);
    try {
      dynamic responses = await Future.wait(
          [_homeRepo.fetchCountries(), _homeRepo.fetchFlags()]);
      (responses[0] as Either<EmptyResponseModel, CountriesModel?>).fold(
          (l) => _changeStatus(false, false, true),
          (r) => countries = r?.response ?? []);
      flagKeys = responses[1] as Map<String, dynamic>;
      _changeStatus(false, true, false);
    } catch (_) {
      _changeStatus(false, false, true);
    }
  }
}
