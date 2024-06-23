import 'package:e_book/features/core_feature/data/repositories/themes_repository.dart';
import 'package:e_book/features/core_feature/domain/repositories/themes_repo.dart';

class GetThemeUseCase {
  ThemesRepo themeRepository;
  GetThemeUseCase({required this.themeRepository});
  Future<bool?> call() async {
    return await themeRepository.getTheme();
  }
}
