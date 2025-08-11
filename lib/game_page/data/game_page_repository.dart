import 'package:igdb_app/game_page/data/mappers/image_mapper.dart';
import 'package:igdb_app/game_page/data/mappers/theme_mapper.dart';
import 'package:igdb_app/game_page/data/mappers/video_mapper.dart';
import 'package:igdb_app/game_page/data/src/game_page_remote_ds.dart';
import 'package:igdb_app/game_page/models/game_image.dart';
import 'package:igdb_app/game_page/models/theme.dart';
import 'package:igdb_app/game_page/models/video.dart';

class GamePageRepository {
  final GamePageRemoteDs gameRemoteDs;

  GamePageRepository(this.gameRemoteDs);

  Future<List<GameImage>> fetchScreenshots(
      {required List<int> screenshotIds}) async {
    final response =
        await gameRemoteDs.fetchScreenshots(screenshotIds: screenshotIds);
    final screenshots = response
        .map(
          (e) => ImageMapper.from(e),
        )
        .toList();
    return screenshots;
  }

  Future<List<GameTheme>> fetchThemes({required List<int> themeIds}) async {
    final response = await gameRemoteDs.fetchThemes(themeIds);
    final themes = response
        .map(
          (e) => ThemeMapper.from(e),
        )
        .toList();
    return themes;
  }

  Future<List<Video>> fetchVideos({required List<int> videoIds}) async {
    final response = await gameRemoteDs.fetchVideos(videoIds);
    final videos = response
        .map(
          (e) => VideoMapper.from(e),
        )
        .toList();
    return videos;
  }

  Future<List<GameImage>> fetchArtworks({required List<int> artworkIds}) async {
    final response = await gameRemoteDs.fetchArtworks(artworkIds);
    final artworks = response
        .map(
          (e) => ImageMapper.from(e),
        )
        .toList();
    return artworks;
  }
}
