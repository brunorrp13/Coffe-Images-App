import 'package:flutter/foundation.dart';

class MyImage {
  final String imageUrl;
  final Uint8List bodyBytes;

  const MyImage({
    required this.imageUrl,
    required this.bodyBytes,
  });
}
