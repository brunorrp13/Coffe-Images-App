import 'package:equatable/equatable.dart';

abstract class CoffeImagesState extends Equatable {}

class InitialState extends CoffeImagesState {
  @override
  List<Object?> get props => <Object>[];
}

class LoadingState extends CoffeImagesState {
  @override
  List<Object?> get props => <Object>[];
}

class SuccessfullyLoadedContentState<T> extends CoffeImagesState {
  final T content;
  SuccessfullyLoadedContentState({required this.content});

  @override
  List<Object?> get props => <Object>[content as Object];
}

// class OnAssetsDataFound extends AssetsState {
//   final StrockResponseModel? assetsResponse;
//   OnAssetsDataFound({
//     this.assetsResponse,
//   });

//   @override
//   List<Object?> get props => <Object?>[assetsResponse];
// }

class OnNoDataFound extends CoffeImagesState {
  OnNoDataFound();

  @override
  List<Object?> get props => <Object?>[];
}