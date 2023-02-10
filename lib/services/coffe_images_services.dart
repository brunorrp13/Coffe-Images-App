import 'dart:convert';

import 'package:coffe_pictures_assessment/image_model.dart';
import 'package:coffe_pictures_assessment/services/url_constant.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class CoffeImagesServiceProtocol {
  Future<MyImage> getCoffeImage(
    String endpoint,
  );
}

class CoffeImagesService implements CoffeImagesServiceProtocol {
  final Dio provider = Dio();

  @override
  Future<MyImage> getCoffeImage(String endpoint) async {
    var url = Uri.https(UrlConstant.baseUrl, endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MyImage(
          imageUrl: json.decode(response.body)["file"],
          bodyBytes: response.bodyBytes);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
