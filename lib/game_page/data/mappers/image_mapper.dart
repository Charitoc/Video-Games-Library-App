import 'package:igdb_app/game_page/data/entities/image_dto.dart';
import 'package:igdb_app/game_page/models/game_image.dart';

class ImageMapper {
  static GameImage from(ImageDTO screenshotDTO) {
    return GameImage(
      id: screenshotDTO.id,
      imageId: screenshotDTO.imageId,
      url: screenshotDTO.url,
    );
  }
}
