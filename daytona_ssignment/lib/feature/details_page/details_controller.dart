import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:daytona_ssignment/feature/details_page/data/model/details_model.dart';
import 'package:daytona_ssignment/feature/details_page/domain/details_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final DetailsRepo _detailsRepo;
  DetailsController(this._detailsRepo);
  bool isLoading = false;
  bool isLoaded = false;
  bool isError = false;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  _changeStatus(bool loading, bool loaded, bool error) {
    isLoading = loading;
    isLoaded = loaded;
    isError = error;
    update();
  }

   DetailsModel? data;
  void fetchData() async {
    _changeStatus(true, false, false);
    Either<EmptyResponseModel, DetailsModel?> result =
        await _detailsRepo.fetchDetails(Get.parameters["country"]);
    result.fold((l) {
      Get.snackbar("Alert", l.msg ?? "Error", backgroundColor: Colors.red);
      _changeStatus(false, false, true);
    }, (r) {
      data = r;
      _changeStatus(false, true, false);
    });
  }
}
