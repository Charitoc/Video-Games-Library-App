import 'package:igdb_api/remote_client.dart';
import 'package:igdb_app/home/data/entities/cover_dto.dart';
import 'package:igdb_app/home/data/entities/game_dto.dart';
import 'package:igdb_app/home/data/entities/popular_game_dto.dart';

class HomeRemoteDS {
  HomeRemoteDS(this._remoteApiClient);

  final RemoteApiClientImplementation _remoteApiClient;

  Future<List<PopularGameDTO>> fetchPopularGames({required String date}) async {
    final response = await _remoteApiClient
        .postTyped<List>('/popularity_primitives', data: '''
          fields game_id,value,popularity_type; sort value desc; limit 10; where popularity_type = 3;
          ''');
    return (response.data!).map((e) => PopularGameDTO.fromJson(e)).toList();
  }

  Future<List<PopularGameDTO>> fetchUpcomingGames(
      {required String date}) async {
    final response = await _remoteApiClient
        .postTyped<List>('/popularity_primitives', data: '''
          fields *; sort value desc; limit 10; where popularity_type = 5;
          ''');
    return (response.data!).map((e) => PopularGameDTO.fromJson(e)).toList();
  }

  Future<List<GameDTO>> fetchGames({
    required List<String>? gameIds,
    int? limit = 10,
  }) async {
    final gameIdsString = gameIds?.join(', ');
    final limitAsString = limit.toString();
    final response = await _remoteApiClient.postTyped<List>(
      '/games',
      data: '''
            fields *;
            where id = ($gameIdsString);
            limit $limitAsString;
          ''',
    );

    return (response.data!).map((e) => GameDTO.fromJson(e)).toList();
  }

  Future<List<CoverDTO>> fetchCovers({
    List<String>? gameIds,
  }) async {
    final gameIdsString = gameIds?.join(', ');
    final response = await _remoteApiClient.postTyped<List>(
      '/covers',
      data: '''
          fields *;
          where id = ($gameIdsString);
          limit 10;
        ''',
    );
    return (response.data!).map((e) => CoverDTO.fromJson(e)).toList();
  }
}
