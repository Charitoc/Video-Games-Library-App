// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/game_page/data/game_page_repository.dart';
import 'package:igdb_app/game_page/models/game_image.dart';
import 'package:igdb_app/game_page/models/theme.dart';
import 'package:igdb_app/game_page/models/video.dart';

part 'game_page_state.dart';

class GamePageCubit extends Cubit<GamePageState> {
  GamePageCubit({
    required this.game,
    required this.gamePageRepository,
  }) : super(GamePageState.initial(game));

  final Game game;
  final GamePageRepository gamePageRepository;

  void initialize() async {
    final data = await Future.wait([
      game.screenshots.isNotEmpty
          ? gamePageRepository.fetchScreenshots(screenshotIds: game.screenshots)
          : Future.value(<GameImage>[]),
      game.themeIds.isNotEmpty
          ? gamePageRepository.fetchThemes(themeIds: game.themeIds)
          : Future.value(<GameTheme>[]),
      game.artworks.isNotEmpty
          ? gamePageRepository.fetchArtworks(artworkIds: game.artworks)
          : Future.value(<GameImage>[]),
      game.videos.isNotEmpty
          ? gamePageRepository.fetchVideos(videoIds: game.videos)
          : Future.value(<Video>[])
    ]);

    emit(
      state.copyWith(
        screenshots: data[0] as List<GameImage>,
        themes: data[1] as List<GameTheme>,
        artworks: data[2] as List<GameImage>,
        videos: data[3] as List<Video>,
      ),
    );
  }
}
