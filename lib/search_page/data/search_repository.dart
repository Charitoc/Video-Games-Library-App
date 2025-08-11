import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/home/data/mappers/game_cover_mapper.dart';
import 'package:igdb_app/home/data/mappers/game_mapper.dart';
import 'package:igdb_app/home/models/cover.dart';
import 'package:igdb_app/search_page/data/src/search_remote_ds.dart';

class SearchRepository {
  SearchRepository(this.remoteDS);

  final SearchRemoteDs remoteDS;

  Future<List<Game>> fetchGames(List<int>? gameIds, int? limit) async {
    // final date = DateTime.now().subtract(Duration(days: 365));
    // final unixTimestamp = date.millisecondsSinceEpoch ~/ 1000;
    final itemDTO = await remoteDS.fetchGames(gameIds: gameIds, limit: limit);
    final itemList = itemDTO.map((e) => GameMapper.from(e)).toList();
    return itemList;
  }

  Future<List<int>> fetchResultsAccordingToTerm({required String term}) async {
    final termResultsDTO =
        await remoteDS.fetchResultsAccordingToTerm(term: term);
    // final game = GameMapper.from(gameDTO);
    final termResults = termResultsDTO
        .map(
          (e) => e.id,
        )
        .toList();
    return termResults;
  }

  Future<List<Cover>> fetchCovers(List<String> gameIds) async {
    final itemDTO = await remoteDS.fetchCovers(gameIds: gameIds);
    final itemList = itemDTO.map((e) => GameCoverMapper.from(e)).toList();
    return itemList;
  }
}
