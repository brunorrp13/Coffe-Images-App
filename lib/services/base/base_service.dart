import 'dart:convert';
import 'dart:io';

import 'package:coffe_pictures_assessment/services/base/empty_response.dart';
import 'package:coffe_pictures_assessment/services/url_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../decodable/decodable.dart';
import 'base_request.dart';
// ignore: depend_on_referenced_packages

import 'failure_response.dart';

mixin BaseService {
  T handle<T>(dynamic response) {
    if (T == EmptyResponse) {
      return EmptyResponse() as T;
    }
    final json = jsonDecode(response.data) as Map<String, dynamic>;
    return Decodable.decode.fromJson<T>(json);
  }

  Future<Either<FailureResponse, T>> execute<T>(
      {required BaseHTTPRequest request,
      required Dio provider,
      HttpMethod? method,
      bool formData = false}) async {
    try {
      final String requestPath = _baseUrl + request.endpoint;
      var headers = request.headers;

      Response<String>? response;
      switch (method) {
        case HttpMethod.post:
          if (formData) {
            FormData formData = FormData.fromMap({
              "file": await MultipartFile.fromFile(request.body['filePath'],
                  filename: 'image'),
            });
            response = await provider.post(
              requestPath,
              data: formData,
              options: Options(
                headers: headers,
              ),
            );
          } else {
            response = await provider.post(
              requestPath,
              data: jsonEncode(request.body),
              options: Options(
                headers: headers,
              ),
            );
          }
          break;
        case HttpMethod.put:
          response = await provider.put(
            requestPath,
            data: jsonEncode(request.body),
            options: Options(
              headers: headers,
            ),
          );
          break;
        case HttpMethod.delete:
          response = await provider.delete(
            requestPath,
            queryParameters: request.params,
            options: Options(
              headers: headers,
            ),
          );
          break;
        default:
          response = await provider.get(
            requestPath,
            queryParameters: request.params,
            options: Options(
              headers: headers,
            ),
          );
          break;
      }
      return Right(
        handle<T>(
          response,
        ),
      );
    } on DioError catch (exception) {
      return Left(
        handle<FailureResponse>(
          exception.response,
        ),
      );
    }
  }

  String get _baseUrl {
    return UrlConstant.baseUrl;
  }
}
