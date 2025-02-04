import 'package:flutter/cupertino.dart';

class ProductColorHelper {
  static Color? color({required String hex}) {
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    final int? decimal = int.tryParse(hex, radix: 16);
    return Color(decimal!);
  }
}
