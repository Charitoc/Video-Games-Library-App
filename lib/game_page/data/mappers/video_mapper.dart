import 'package:igdb_app/game_page/data/entities/video_dto.dart';
import 'package:igdb_app/game_page/models/video.dart';

class VideoMapper {
  static Video from(VideoDTO videoDTO) {
    return Video(
      id: videoDTO.id,
      videoId: videoDTO.videoId,
      name: videoDTO.name,
      game: videoDTO.game,
    );
  }
}
