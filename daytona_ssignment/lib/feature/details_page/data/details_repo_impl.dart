import 'package:daytona_ssignment/feature/details_page/data/model/details_model.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/feature/details_page/domain/details_repo.dart';
import 'package:daytona_ssignment/utils/client.dart';

class DetailsRepoImpl extends DetailsRepo {
  final ApiClient _apiClient;
  DetailsRepoImpl(this._apiClient);
  @override
  Future<Either<EmptyResponseModel, DetailsModel?>> fetchDetails(
      String? country) async {
    return await _apiClient.get("/statistics?country=$country", DetailsModel());
  }
}
