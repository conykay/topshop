import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeSelectCubit extends Cubit<int> {
  ProductSizeSelectCubit() : super(0);
  var selectedIndex = 0;
  void selectSize({required int index}) {
    selectedIndex = index;
    emit(index);
  }
}
