import 'package:coffe_pictures_assessment/services/coffe_images_services.dart';
import 'package:coffe_pictures_assessment/services/url_constant.dart';

abstract class CoffeImagesRepositoryProtocol {
  Future<dynamic> getCoffeImage();
}

class CoffeImagesRepository implements CoffeImagesRepositoryProtocol {
  CoffeImagesService service = CoffeImagesService();

  @override
  Future<dynamic> getCoffeImage() async {
    var response = await service.getCoffeImage(UrlConstant.endpoint);
    return response;
  }
}
