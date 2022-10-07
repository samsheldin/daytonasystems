import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:daytona_ssignment/feature/home_page/data/models/countries_model.dart';

abstract class HomeRepo {
  Future<Either<EmptyResponseModel, CountriesModel?>> fetchCountries();
  Future<Map<String, dynamic>> fetchFlags();
}
