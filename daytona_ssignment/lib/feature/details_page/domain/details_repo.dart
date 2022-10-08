import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:daytona_ssignment/feature/details_page/data/model/details_model.dart';

abstract class DetailsRepo {
  Future<Either<EmptyResponseModel,DetailsModel?>> fetchDetails(String?country);
}