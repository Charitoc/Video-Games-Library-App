import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/home/data/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.repository,
  ) : super(HomeState.initial());

  final HomeRepository repository;

  void initialize() async {
    emit(state.copyWith(isLoading: true));

    final popularGames = await fetchPopularGames();
    final upcomingGames = await fetchUpcomingGames();
    emit(state.copyWith(
        isLoading: false, games: popularGames, upcomingGames: upcomingGames));
  }

  // void fetchSingleGame({required String name}) async{
  //   final game = await repository.fetchSingleGame(name: name);
  //   emit(state.copyWith(gameToBeSearched: game));
  // }

  Future<List<Game>> fetchPopularGames() async {
    final popularGames = await repository.fetchPopularGames();
    final games = await fetchGames(
        popularGames.map((e) => e.gameId.toString()).toList(), 10);
    return games;
  }

  Future<List<Game>> fetchUpcomingGames() async {
    final upcomingGames = await repository.fetchUpcomingGames();
    final games = await fetchGames(
        upcomingGames.map((e) => e.gameId.toString()).toList(), 10);
    return games;
  }

  Future<List<Game>> fetchGames(List<String>? gameIds, int? limit) async {
    var games = await repository.fetchGames(gameIds, limit);

    // Create a lookup for ID -> index
    final indexMap = {for (var i = 0; i < gameIds!.length; i++) gameIds[i]: i};

    // Sort using the indexMap
    games.sort((a, b) =>
        indexMap[a.id.toString()]!.compareTo(indexMap[b.id.toString()]!));

    final covers = await repository.fetchCovers(games
        .map(
          (e) => e.coverUrl ?? '',
        )
        .toList());

    games = games
        .map((e) => e.copyWith(
                cover: covers.firstWhere(
              (element) => element.game == e.id,
            )))
        .toList();

    return games;
  }
}
