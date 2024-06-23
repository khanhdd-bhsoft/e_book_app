import 'package:e_book/features/core_feature/domain/usecases/themes/change_theme_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/themes/get_theme_uc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  GetThemeUseCase getThemeUseCase;
  ChangeThemeUseCase changeThemeUseCase;
  ThemeCubit({required this.changeThemeUseCase, required this.getThemeUseCase})
      : super(false) {
    _init();
  }
  Future<void> _init() async {
    final bool? currentTheme = await getThemeUseCase.call();
    if (currentTheme != null) {
      emit(currentTheme);
    } else {
      emit(true);
    }
  }

  Future<void> changeTheme(bool value) async {
    await changeThemeUseCase.call(value);
    emit(value);
  }
}
