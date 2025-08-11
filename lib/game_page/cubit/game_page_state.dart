// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_page_cubit.dart';

class GamePageState extends Equatable {
  const GamePageState({
    required this.game,
    required this.screenshots,
    required this.themes,
    required this.artworks,
    required this.videos,
  });

  final Game game;
  final List<GameImage> screenshots;
  final List<GameTheme> themes;
  final List<GameImage> artworks;
  final List<Video> videos;

  factory GamePageState.initial(Game game) => GamePageState(
        game: game,
        screenshots: [],
        themes: [],
        artworks: [],
        videos: [],
      );

  GamePageState copyWith({
    Game? game,
    List<GameImage>? screenshots,
    List<GameTheme>? themes,
    List<GameImage>? artworks,
    List<Video>? videos,
  }) {
    return GamePageState(
      game: game ?? this.game,
      screenshots: screenshots ?? this.screenshots,
      themes: themes ?? this.themes,
      artworks: artworks ?? this.artworks,
      videos: videos ?? this.videos,
    );
  }

  @override
  List<Object> get props => [
        game,
        screenshots,
        themes,
        artworks,
        videos,
      ];
}
