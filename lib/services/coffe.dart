import 'package:coffe_pictures_assessment/extension/map_json_extension.dart';
import 'package:coffe_pictures_assessment/services/base/base_response.dart';

class CoffeImagesResponse extends BaseResponse {
  final String? image;

  CoffeImagesResponse({
    required this.image,
  });

  factory CoffeImagesResponse.fromJson(Map<String, dynamic> json) {
    return CoffeImagesResponse(
      image: json.stringOf(
        'file',
      ),
    );
  }
}
