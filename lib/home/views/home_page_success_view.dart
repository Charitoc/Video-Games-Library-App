// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/custom_page_route.dart';
import 'package:igdb_app/home/widgets/game_card.dart';
import 'package:igdb_app/search_page/view/search_page.dart';

class HomePageSuccessView extends StatefulWidget {
  const HomePageSuccessView({
    super.key,
    required this.popularGames,
  });

  final List<Game> popularGames;

  @override
  State<HomePageSuccessView> createState() => _HomePageSuccessViewState();
}

class _HomePageSuccessViewState extends State<HomePageSuccessView> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
            hitTestBehavior: HitTestBehavior.translucent,
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                scrolledUnderElevation: 0,
                floating: true,
                title: TextField(
                    key: UniqueKey(),
                    readOnly: true,
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
                    onTap: () {
                      Navigator.of(context).push(
                          CustomPageRoute(builder: (context) => SearchPage()));
                    }),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 12),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          GameCard(game: widget.popularGames[index]),
                      childCount: widget.popularGames.length),
                ),
              )
            ]),
      ),
    );
  }
}
