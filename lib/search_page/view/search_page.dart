import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igdb_app/common/helpers/space.dart';
import 'package:igdb_app/custom_page_route.dart';
import 'package:igdb_app/game_page/views/game_page.dart';
import 'package:igdb_app/search_page/cubit/search_cubit.dart';
import 'package:igdb_app/search_page/cubit/search_state.dart';
import 'package:igdb_app/search_page/data/search_repository.dart';
import 'package:igdb_app/search_page/widgets/search_result_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController controller;
  final focusNode = FocusNode();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(context.read<SearchRepository>()),
      child: BlocConsumer<SearchCubit, SearchState>(
        listenWhen: (previous, current) =>
            previous.gameIds != current.gameIds && current.gameIds.isNotEmpty,
        listener: (context, state) =>
            context.read<SearchCubit>().fetchGames(state.gameIds, 5),
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                scrolledUnderElevation: 0,
                title: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF2A3A59), // light fill color
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12), // rounded corners
                      borderSide: BorderSide.none, // no border line
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    hintText: "Search",
                  ),
                  onChanged: (term) {
                    if (term.length >= 3) {
                      context
                          .read<SearchCubit>()
                          .fetchResultsAccordingToTerm(term: term);
                    }
                  },
                  onEditingComplete: () => context
                      .read<SearchCubit>()
                      .fetchResultsAccordingToTerm(term: controller.text),
                  onSubmitted: (term) => context
                      .read<SearchCubit>()
                      .fetchResultsAccordingToTerm(term: term),
                ),
              ),
              body: Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Space.verticalSM,
                  itemCount: state.games.length,
                  itemBuilder: (context, index) => SearchResultTile(
                      game: state.games[index],
                      onTap: () {
                        focusNode.unfocus();
                        Navigator.of(context).push(
                          CustomPageRoute(
                            builder: (context) =>
                                GamePage(game: state.games[index]),
                          ),
                        );
                      }),
                ),
              ));
        },
      ),
    );
  }
}
