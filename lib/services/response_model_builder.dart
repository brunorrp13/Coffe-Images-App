import 'package:coffe_pictures_assessment/services/coffe.dart';

import 'decodable/object_builder_factory.dart';

mixin BuilderFactory {
  static ObjectBuilderFactory buildObjects =
      (Map<String, dynamic> json) => <Type, ObjectBuilder>{
            //Company Details
            CoffeImagesResponse: () => CoffeImagesResponse.fromJson(json)
          };
}
