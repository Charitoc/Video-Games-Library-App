import 'package:igdb_app/game_page/data/entities/theme_dto.dart';
import 'package:igdb_app/game_page/models/theme.dart';

class ThemeMapper {
  static GameTheme from(ThemeDTO themeDTO) {
    return GameTheme(name: themeDTO.name);
  }
}
