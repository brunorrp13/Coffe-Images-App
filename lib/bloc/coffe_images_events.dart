
abstract class CoffeImagesEvent {}

class OnFindAssets extends CoffeImagesEvent {
  final String stock;
  OnFindAssets(this.stock);

  @override
  List<Object?> get props => [stock];
}

class OnFindCoffeImage extends CoffeImagesEvent {
  final String? assetsData;

  OnFindCoffeImage(this.assetsData);

  @override
  List<Object?> get props => [assetsData];
}