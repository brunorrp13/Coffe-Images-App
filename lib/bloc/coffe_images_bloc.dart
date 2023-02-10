import 'package:coffe_pictures_assessment/bloc/coffe_images_events.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_state.dart';
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
        final String? response = await repository.getCoffeImage();
        if (response == null || response.isEmpty) {
          emit(OnNoDataFound());
          return;
        }
        if (response.isNotEmpty) {
          var imageData = OnImageDataFound(imageUrl: response);
          emit(SuccessfullyLoadedContentState<OnImageDataFound>(
              content: imageData));
          return;
        }
        emit(OnNoDataFound());
      } catch (exception) {
        emit(OnNoDataFound());
      }
    });
  }
}
