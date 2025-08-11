// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igdb_app/common/helpers/space.dart';
import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/game_page/cubit/game_page_cubit.dart';
import 'package:igdb_app/game_page/data/game_page_repository.dart';
import 'package:igdb_app/game_page/widgets/image_tile.dart';
import 'package:igdb_app/game_page/widgets/video_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamePageCubit(
          game: game, gamePageRepository: context.read<GamePageRepository>())
        ..initialize(),
      child: GamePageView(game: game),
    );
  }
}

class GamePageView extends StatelessWidget {
  const GamePageView({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamePageCubit, GamePageState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        shape: BoxShape.circle),
                    child: Center(
                        child: SizedBox(
                            width: 16,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ))))),
          ),
          body: Skeletonizer(
            enabled: state.screenshots.isEmpty,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: game.cover != null
                      ? Image.network(
                          'https:${game.cover?.url}'
                              .replaceFirst('t_thumb', 't_1080p'),
                        )
                      : Placeholder(),
                ),
                Space.verticalSM,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    game.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Space.verticalSM,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFE6B56C),
                          ),
                          Space.horizontalXS,
                          Text((game.rating.round() / 10).toString()),
                          SizedBox(
                            width: 8,
                          ),
                          Text('(${game.ratingCount.toString()})')
                        ],
                      ),
                      if (game.firstReleaseDate != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            Space.horizontalXS,
                            Text(game.firstReleaseDate!.year.toString()),
                          ],
                        ),
                    ],
                  ),
                ),
                Space.verticalSM,
                if (state.themes.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 24,
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        separatorBuilder: (context, index) => Space.horizontalS,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.themes.length,
                        itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).highlightColor),
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(state.themes[index].name),
                            ))),
                      ),
                    ),
                  ),
                Space.verticalSM,
                Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: Text(game.description)),
                if (state.videos.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Space.verticalML,
                        Text('Videos'),
                        Space.verticalS,
                        AspectRatio(
                          aspectRatio: 18 / 9,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  VideoTile(video: state.videos[index]),
                              separatorBuilder: (context, index) =>
                                  Space.horizontalS,
                              itemCount: state.videos.length),
                        )
                      ],
                    ),
                  ),
                ],
                if (state.screenshots.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Space.verticalML,
                        Text('Screenshots'),
                        Space.verticalS,
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ImageTile(
                                    index: index,
                                    screenshotList: state.screenshots
                                        .map(
                                          (e) => e.url,
                                        )
                                        .toList(),
                                  ),
                              separatorBuilder: (context, index) =>
                                  Space.horizontalS,
                              itemCount: state.screenshots.length),
                        )
                      ],
                    ),
                  ),
                ],
                if (state.artworks.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Space.verticalML,
                        Text('Artworks'),
                        Space.verticalS,
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ImageTile(
                                    index: index,
                                    screenshotList: state.artworks
                                        .map(
                                          (e) => e.url,
                                        )
                                        .toList(),
                                  ),
                              separatorBuilder: (context, index) =>
                                  Space.horizontalS,
                              itemCount: state.artworks.length),
                        )
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
