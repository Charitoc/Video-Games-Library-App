import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igdb_app/search_page/cubit/search_state.dart';
import 'package:igdb_app/search_page/data/search_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchState.initial());

  final SearchRepository searchRepository;

  void fetchResultsAccordingToTerm({required String term}) async {
    final termResultsIds =
        await searchRepository.fetchResultsAccordingToTerm(term: term);
    emit(state.copyWith(gameIds: termResultsIds));
  }

  void fetchGames(List<int>? gameIds, int? limit) async {
    var games = await searchRepository.fetchGames(gameIds, limit);

    // Create a lookup for ID -> index
    final indexMap = {for (var i = 0; i < gameIds!.length; i++) gameIds[i]: i};

    // Sort using the indexMap
    games.sort((a, b) => indexMap[a.id]!.compareTo(indexMap[b.id]!));
    games.removeWhere(
      (game) => game.coverUrl == null || game.coverUrl == 'null',
    );

    final covers = await searchRepository.fetchCovers(games
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

    emit(state.copyWith(games: games));
  }
}
