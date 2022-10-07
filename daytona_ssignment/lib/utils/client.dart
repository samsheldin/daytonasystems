import 'dart:convert';
import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dartz/dartz.dart';
import 'package:daytona_ssignment/data/empty_response_model.dart';
import 'package:daytona_ssignment/domain/entity/model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class ApiClient extends GetxService {
  late dio.Dio dioInstance;
  ApiClient() {
    Alice alice = Alice(showNotification: false, navigatorKey: Get.key);
    dio.BaseOptions options = dio.BaseOptions(
      baseUrl: "https://covid-193.p.rapidapi.com",
    );
    dioInstance = dio.Dio(options)..interceptors.add(alice.getDioInterceptor());
  }

  dio.Dio get client => dio.Dio();

  Future<Either<EmptyResponseModel, T?>> get<T extends Models<dynamic>, R>(
      String path, T obj,
      {bool isAuthorised = true, bool noBodyRequired = false}) async {
    try {
      dio.Response response = await dioInstance.get(path,
          options: dio.Options(headers: {
            'X-RapidAPI-Key':
                "e930828afbmsh3837bb01bb9a8a3p168b28jsn46ba7f810b7e",
          }));
      return _returnResponse(response, obj, noBodyRequired: noBodyRequired);
    } on SocketException {
      return left(EmptyResponseModel(code: 1001, msg: "No Internet"));
    } on dio.DioError catch (e) {
      if (e.error is SocketException) {
        return left(EmptyResponseModel(code: 1000, msg: e.message));
      } else if (e.response != null) {
        return _returnResponse(e.response, obj);
      } else {
        return left(EmptyResponseModel(code: 1000, msg: e.message));
      }
    } catch (e) {
      return left(EmptyResponseModel(code: 1000, msg: e.toString()));
    }
  }

  Future<Either<EmptyResponseModel, T?>>
      _returnResponse<T extends Models<dynamic>, R>(
          dio.Response? response, T? obj,
          {bool isAutorised = true, bool noBodyRequired = false}) async {
    if (noBodyRequired) {
      return right(null);
    } else {
      Map innerResponse = {};
      var responseJson = response?.data;
      if (!isAutorised) {
        innerResponse = json.decode(responseJson["response"]);
      }
      switch (response?.statusCode) {
        case 200:
          try {
            return right(obj?.fromJson(responseJson));
          } catch (_) {
            return left(
                EmptyResponseModel(code: 100, msg: "Data type mismatch"));
          }
        case 201:
          return right(obj?.fromJson(responseJson));

        case 204:
          return right(null);
        case 400:
          return left(EmptyResponseModel(
              code: 400, msg: response?.statusMessage ?? "error"));
        case 401:
          return left(EmptyResponseModel(
              code: 401, msg: innerResponse["error_description"] ?? "error"));

        case 403:
          if (isAutorised) {
            return left(EmptyResponseModel(
                code: 401,
                msg: response?.statusMessage ??
                    innerResponse["msg"] ??
                    "error"));
          } else {
            return left(EmptyResponseModel(
                code: 401, msg: innerResponse["error_description"] ?? "error"));
          }
        case 404:
          return left(EmptyResponseModel(
              code: 404,
              msg: response?.statusMessage ??
                  innerResponse["msg"] ??
                  "Not found"));
        case 406:
          return left(EmptyResponseModel(
              code: 406,
              msg: response?.statusMessage ?? innerResponse["msg"] ?? 'error'));
        case 500:
          return left(EmptyResponseModel(
              code: 500,
              msg: innerResponse["msg"] ??
                  response?.statusMessage ??
                  'Server error'));

        default:
          return left(EmptyResponseModel(code: 1000, msg: 'Unknown error'));
      }
    }
  } //400,401,403,406
}
