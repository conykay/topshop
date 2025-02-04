import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorSelectCubit extends Cubit<int> {
  ProductColorSelectCubit() : super(0);
  var selectedIndex = 0;
  void selectColor({required int index}) {
    selectedIndex = index;
    emit(index);
  }
}
