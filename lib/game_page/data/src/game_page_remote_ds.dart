import 'package:igdb_api/remote_client.dart';
import 'package:igdb_app/game_page/data/entities/image_dto.dart';
import 'package:igdb_app/game_page/data/entities/theme_dto.dart';
import 'package:igdb_app/game_page/data/entities/video_dto.dart';

class GamePageRemoteDs {
  final RemoteApiClientImplementation _remoteApiClient;

  GamePageRemoteDs(this._remoteApiClient);

  Future<List<ImageDTO>> fetchScreenshots(
      {required List<int> screenshotIds}) async {
    final screenshotsAsString = screenshotIds.join(', ');
    final response =
        await _remoteApiClient.postTyped<List>('/screenshots', data: '''
          fields *; where id = ($screenshotsAsString);
          ''');

    return (response.data!).map((e) => ImageDTO.fromJson(e)).toList();
  }

  Future<List<ThemeDTO>> fetchThemes(
    List<int>? themeIds,
  ) async {
    final themeIdsString = themeIds?.join(', ');

    final response = await _remoteApiClient.postTyped<List>(
      '/themes',
      data: '''
          fields name;
          where id = ($themeIdsString);
        ''',
    );

    return (response.data!).map((e) => ThemeDTO.fromJson(e)).toList();
  }

  Future<List<VideoDTO>> fetchVideos(
    List<int>? videoIds,
  ) async {
    final videoIdsString = videoIds?.join(', ');

    final response = await _remoteApiClient.postTyped<List>(
      '/game_videos',
      data: '''
          fields *;
          where id = ($videoIdsString);
        ''',
    );

    return (response.data!).map((e) => VideoDTO.fromJson(e)).toList();
  }

  Future<List<ImageDTO>> fetchArtworks(
    List<int>? artworkIds,
  ) async {
    final artworkdsString = artworkIds?.join(', ');

    final response = await _remoteApiClient.postTyped<List>(
      '/artworks',
      data: '''
          fields *;
          where id = ($artworkdsString);
        ''',
    );

    return (response.data!).map((e) => ImageDTO.fromJson(e)).toList();
  }
}
