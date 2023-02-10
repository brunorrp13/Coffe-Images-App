import 'dart:convert';

import 'package:coffe_pictures_assessment/services/coffe.dart';
import 'package:coffe_pictures_assessment/services/coffe_images_request.dart';
import 'package:coffe_pictures_assessment/services/failure_response.dart';
import 'package:coffe_pictures_assessment/services/url_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:http/http.dart' as http;

abstract class CoffeImagesServiceProtocol {
  Future<Either<FailureResponse, String>> getCoffeImage(
    String endpoint,
  );
}

class CoffeImagesService implements CoffeImagesServiceProtocol {
  final Dio provider = Dio();

  @override
  Future<Either<FailureResponse, String>> getCoffeImage(String endpoint) async {
    var url = Uri.https(UrlConstant.baseUrl, endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body)["file"];
    } else {
      throw Exception('Failed to load post');
    }
  }
}
