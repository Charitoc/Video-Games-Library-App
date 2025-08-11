import 'package:igdb_app/home/data/entities/cover_dto.dart';
import 'package:igdb_app/home/models/cover.dart';

class GameCoverMapper {
  static Cover from(CoverDTO coverDTO) {
    return Cover(
      id: coverDTO.id,
      game: coverDTO.game,
      url: coverDTO.url,
    );
  }
}
