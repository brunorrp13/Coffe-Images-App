import 'package:coffe_pictures_assessment/bloc/coffe_images_events.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_state.dart';
import 'package:coffe_pictures_assessment/model/image_model.dart';
import 'package:coffe_pictures_assessment/repository/coffe_images_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeImagesBloc extends Bloc<CoffeImagesEvent, CoffeImagesState> {
  CoffeImagesRepository repository = CoffeImagesRepository();

  CoffeImagesBloc({
    required this.repository,
  }) : super(InitialState()) {
    on<OnFindCoffeImage>((event, emit) async {
      emit(LoadingState());
      try {
        final MyImage? response = await repository.getCoffeImage();
        if (response == null || response.imageUrl.isEmpty) {
          emit(OnNoDataFound());
          return;
        }
        var imageData = OnImageDataFound(myImage: response);
        emit(SuccessfullyLoadedContentState<OnImageDataFound>(
            content: imageData));
        return;
      } catch (exception) {
        emit(OnNoDataFound());
      }
    });
  }
}
