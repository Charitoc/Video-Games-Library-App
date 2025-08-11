// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/home/cubit/home_cubit.dart';
import 'package:igdb_app/home/data/home_repository.dart';
import 'package:igdb_app/home/views/home_page_loading_view.dart';
import 'package:igdb_app/home/views/home_page_success_view.dart';
import 'package:igdb_app/home/widgets/game_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(context.read<HomeRepository>())..initialize(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return HomePageLoadingView();
          }

          return HomePageSuccessView(
            popularGames: state.popularGames,
          );
        },
      ),
    );
  }
}

class ParallaxList extends StatelessWidget {
  const ParallaxList({
    super.key,
    required this.games,
  });

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: games.length,
      itemBuilder: (context, index) => GameCard(game: games[index]),
    );
  }
}
