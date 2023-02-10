import 'package:coffe_pictures_assessment/services/decodable/object_builder_factory.dart';
import 'package:coffe_pictures_assessment/services/response_model_builder.dart';

mixin MixinModelFactory {
  static ObjectBuilderFactory buildObjects = (Map<String, dynamic> json) =>
      <Type, ObjectBuilder>{}..addAll(BuilderFactory.buildObjects(json));
}
