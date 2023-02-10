import 'package:coffe_pictures_assessment/extension/map_json_extension.dart';
import 'package:coffe_pictures_assessment/services/base/base_response.dart';

class FailureResponseModel extends BaseResponse {
  final String? code;
  final String? message;

  FailureResponseModel({
    required this.code,
    required this.message,
  });

  factory FailureResponseModel.fromJson(Map<String, dynamic> json) {
    return FailureResponseModel(
      code: json.stringOf(
        'code',
      ),
      message: json.stringOf(
        'message',
      ),
    );
  }
}
