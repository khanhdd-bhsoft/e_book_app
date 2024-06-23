import 'package:e_book/features/core_feature/domain/repositories/themes_repo.dart';

import '../../../data/repositories/themes_repository.dart';

class ChangeThemeUseCase {
  ThemesRepo themeRepository;
  ChangeThemeUseCase({required this.themeRepository});
  Future<void> call(bool value) async {
    return await themeRepository.changeTheme(value);
  }
}
