extension StringUnwrapping on Map {
  String? stringOf(String key) {
    return this[key];
  }
}

extension Doublenwrapping on Map {
  double? doubleOf(String key) {
    if (this[key] is int) {
      return (this[key] as int).toDouble();
    }
    return this[key];
  }
}

extension IntUnwrapping on Map {
  int? intOf(String key) {
    return this[key];
  }
}

extension BoolUnwrapping on Map {
  bool? boolOf(String key) {
    return this[key];
  }
}
