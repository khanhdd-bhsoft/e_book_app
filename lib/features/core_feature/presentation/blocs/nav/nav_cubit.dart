import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int> {
  int pageIndex = 0;
  NavCubit() : super(0);
  void navigateTo(int index) {
    emit(index);
  }
}
