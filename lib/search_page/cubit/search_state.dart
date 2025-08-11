// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:igdb_app/common/models/game.dart';

class SearchState extends Equatable {
  const SearchState({
    required this.gameIds,
    required this.games,
  });

  final List<int> gameIds;
  final List<Game> games;

  factory SearchState.initial() => SearchState(
        gameIds: [],
        games: [],
      );

  SearchState copyWith({
    List<int>? gameIds,
    List<Game>? games,
  }) {
    return SearchState(
      gameIds: gameIds ?? this.gameIds,
      games: games ?? this.games,
    );
  }

  @override
  List<Object> get props => [gameIds, games];
}
