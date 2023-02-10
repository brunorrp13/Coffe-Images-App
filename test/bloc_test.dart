import 'package:bloc_test/bloc_test.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_bloc.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_events.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_state.dart';
import 'package:coffe_pictures_assessment/image_model.dart';
import 'package:coffe_pictures_assessment/repository/coffe_images_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CoffeImagesRepositoryMock extends Mock implements CoffeImagesRepository {}

void main() {
  late CoffeImagesRepository coffeImagesRepositoryMock;

  MyImage jsonMockedResponse = MyImage(
      imageUrl: "https://coffee.alexflipnote.dev/-6XDHFtPZe8_coffee.png",
      bodyBytes: Uint8List.fromList([10, 125]));
  late CoffeImagesBloc _bloc;
  late MyImage img;

  setUp(() {
    coffeImagesRepositoryMock = CoffeImagesRepositoryMock();
    _bloc = CoffeImagesBloc(repository: coffeImagesRepositoryMock);
  });
  group('CoffeImagesBloc', () {
    test("Initial Test!", () {
      expect(_bloc.state, InitialState());
    });
    blocTest<CoffeImagesBloc, CoffeImagesState>(
      'emits OnDataFound when nothing is found is added',
      build: () {
        when(coffeImagesRepositoryMock.getCoffeImage())
            .thenAnswer((_) async => jsonMockedResponse);
        return _bloc;
      },
      act: ((bloc) => bloc.add(OnFindCoffeImage())),
      expect: () => <CoffeImagesState>[
        LoadingState(),
        SuccessfullyLoadedContentState<OnImageDataFound>(
            content: OnImageDataFound(myImage: jsonMockedResponse))
      ],
    );
    blocTest<CoffeImagesBloc, CoffeImagesState>(
      'emits OnNoDataFound when nothing is found is added',
      build: () => _bloc,
      act: ((bloc) => bloc.add(OnFindCoffeImage())),
      expect: () => <CoffeImagesState>[LoadingState(), OnNoDataFound()],
    );
  });
}
