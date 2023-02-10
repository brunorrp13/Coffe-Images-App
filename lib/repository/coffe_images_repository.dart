abstract class CoffeImagesRepositoryProtocol {
  Future<String>? getCoffeImage(String stock);
}

class CoffeImagesRepository implements CoffeImagesRepositoryProtocol {
  @override
  Future<String>? getCoffeImage(String stock) async {
    var response;
    return response;
  }
}
