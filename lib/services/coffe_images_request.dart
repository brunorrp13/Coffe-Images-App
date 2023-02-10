import 'package:coffe_pictures_assessment/services/base/base_request.dart';

class CoffeImagesRequest extends BaseRequest {
  CoffeImagesRequest();

  @override
  String get endpoint => 'https://coffee.alexflipnote.dev/random';
}
