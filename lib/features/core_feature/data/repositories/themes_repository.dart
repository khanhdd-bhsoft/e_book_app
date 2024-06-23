import '../../domain/repositories/themes_repo.dart';
import '../data_sources/themes_data_source.dart';

class ThemeRepository implements ThemesRepo {
  ThemesDataSource themesDataSource;
  ThemeRepository({required this.themesDataSource});
  @override
  Future<void> changeTheme(bool value) async {
    try {
      await themesDataSource.changeTheme(value);
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }

  @override
  Future<bool?> getTheme() async {
    try {
      return await themesDataSource.getTheme();
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }
}
