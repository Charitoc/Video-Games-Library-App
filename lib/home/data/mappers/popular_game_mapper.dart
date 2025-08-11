import 'package:igdb_app/home/data/entities/popular_game_dto.dart';
import 'package:igdb_app/home/models/popular_game.dart';

class PopularGameMapper {
  static PopularGame from(PopularGameDTO popularGameDTO) {
    return PopularGame(
      id: popularGameDTO.id,
      gameId: popularGameDTO.gameId.toString(),
    );
  }
}
