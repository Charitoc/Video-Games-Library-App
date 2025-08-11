import 'package:igdb_api/remote_client.dart';
import 'package:igdb_app/home/data/entities/cover_dto.dart';
import 'package:igdb_app/home/data/entities/game_dto.dart';
import 'package:igdb_app/search_page/data/entities/term_result_dto.dart';

class SearchRemoteDs {
  SearchRemoteDs(this._remoteApiClient);

  final RemoteApiClientImplementation _remoteApiClient;

  Future<List<TermResultDTO>> fetchResultsAccordingToTerm({
    required String term,
  }) async {
    final response = await _remoteApiClient.postTyped<List>(
      '/games',
      data: '''
            search "$term";
          ''',
    );
    return (response.data!).map((e) => TermResultDTO.fromJson(e)).toList();
  }

  Future<List<GameDTO>> fetchGames({
    required List<int>? gameIds,
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
