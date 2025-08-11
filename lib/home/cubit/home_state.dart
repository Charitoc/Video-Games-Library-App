// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.isLoading,
    required this.games,
    required this.popularGames,
  });

  final bool isLoading;
  final List<Game> games;
  final List<Game> popularGames;

  factory HomeState.initial() => const HomeState(
        isLoading: false,
        games: [],
        popularGames: [],
      );

  @override
  List<Object?> get props => [isLoading, games, popularGames];

  HomeState copyWith({
    bool? isLoading,
    List<Game>? games,
    List<Game>? upcomingGames,
    Game? gameToBeSearched,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      games: games ?? this.games,
      popularGames: upcomingGames ?? popularGames,
    );
  }
}
