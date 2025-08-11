import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/home/data/mappers/game_cover_mapper.dart';
import 'package:igdb_app/home/data/mappers/game_mapper.dart';
import 'package:igdb_app/home/data/mappers/popular_game_mapper.dart';
import 'package:igdb_app/home/data/src/home_remote_ds.dart';
import 'package:igdb_app/home/models/cover.dart';
import 'package:igdb_app/home/models/popular_game.dart';

class HomeRepository {
  HomeRepository(this.remoteDS);

  final HomeRemoteDS remoteDS;

  Future<List<PopularGame>> fetchPopularGames() async {
    final date = DateTime.now().subtract(Duration(days: 365));
    final unixTimestamp = date.millisecondsSinceEpoch ~/ 1000;
    final itemDTO = await remoteDS.fetchPopularGames(
      date: unixTimestamp.toString(),
    );
    final itemList = itemDTO.map((e) => PopularGameMapper.from(e)).toList();
    return itemList;
  }

  Future<List<PopularGame>> fetchUpcomingGames() async {
    final date = DateTime.now().fromDateTimeToUnix();
    final itemDTO = await remoteDS.fetchUpcomingGames(
      date: date.toString(),
    );
    final itemList = itemDTO.map((e) => PopularGameMapper.from(e)).toList();
    return itemList;
  }

  Future<List<Game>> fetchGames(List<String>? gameIds, int? limit) async {
    // final date = DateTime.now().subtract(Duration(days: 365));
    // final unixTimestamp = date.millisecondsSinceEpoch ~/ 1000;
    final itemDTO = await remoteDS.fetchGames(gameIds: gameIds, limit: limit);
    final itemList = itemDTO.map((e) => GameMapper.from(e)).toList();
    return itemList;
  }

  Future<List<Cover>> fetchCovers(List<String> gameIds) async {
    final itemDTO = await remoteDS.fetchCovers(gameIds: gameIds);
    final itemList = itemDTO.map((e) => GameCoverMapper.from(e)).toList();
    return itemList;
  }
}
