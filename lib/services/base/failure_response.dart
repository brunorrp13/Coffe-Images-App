import 'package:coffe_pictures_assessment/extension/map_json_extension.dart';
import 'package:coffe_pictures_assessment/models/failure_response_model.dart';
import 'package:coffe_pictures_assessment/services/base/base_response.dart';

class FailureResponse extends BaseResponse {
  final String? message;
  final List<FailureResponseModel>? response;

  FailureResponse({
    required this.message,
    required this.response,
  });
}
