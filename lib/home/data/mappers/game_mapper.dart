import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/home/data/entities/game_dto.dart';

class GameMapper {
  static Game from(GameDTO gameDTO) {
    return Game(
      id: gameDTO.id,
      name: gameDTO.name,
      description: gameDTO.summary ?? '',
      coverUrl: gameDTO.cover.toString(),
      rating: gameDTO.rating ?? 0,
      ratingCount: gameDTO.ratingCount ?? 0,
      firstReleaseDate: gameDTO.firstReleaseDate?.fromUnixToDateTime(),
      cover: null,
      screenshots: gameDTO.screenshots ?? [],
      themeIds: gameDTO.themes ?? [],
      artworks: gameDTO.artworks ?? [],
      videos: gameDTO.videos ?? [],
    );
  }
}

extension DateConvertor on int {
  DateTime fromUnixToDateTime() {
    int timestampMillis = this * 1000;

    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestampMillis, isUtc: true);
    return date;
  }
}

extension UnixConvertor on DateTime {
  int fromDateTimeToUnix() {
    DateTime now = this;
    int unixTimestamp = now.millisecondsSinceEpoch ~/ 1000;
    return unixTimestamp;
  }
}
