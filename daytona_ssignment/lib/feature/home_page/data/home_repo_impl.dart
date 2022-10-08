import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:daytona_ssignment/feature/home_page/data/models/countries_model.dart';
import 'package:daytona_ssignment/feature/home_page/domain/home_repo.dart';
import 'package:daytona_ssignment/utils/client.dart';
import 'package:dio/src/response.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClient _apiClient;
  HomeRepoImpl(this._apiClient);
  @override
  Future<Either<EmptyResponseModel, CountriesModel?>> fetchCountries() async {
    return _apiClient.get("/countries", CountriesModel());
  }

  @override
  Future<Map<String, dynamic>> fetchFlags() async {
    Response response =
        await _apiClient.client.get("https://flagcdn.com/en/codes.json");
    return response.data as Map<String, dynamic>;
  }
}
