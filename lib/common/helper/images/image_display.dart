import 'package:topshop/core/constants/app_urls.dart';

class ImageDisplayHelper {
  static String displayCategoryImage(String title) {
    return AppUrl.categoryImage + title + AppUrl.alt;
  }
}
