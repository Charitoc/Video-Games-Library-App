// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igdb_app/common/models/game.dart';
import 'package:igdb_app/custom_page_route.dart';
import 'package:igdb_app/game_page/views/game_page.dart';
import 'package:igdb_app/home/widgets/parallax_flow_delegate.dart';

@immutable
class GameCard extends StatelessWidget {
  GameCard({
    super.key,
    required this.game,
  });

  final Game game;
  final GlobalKey _backgroundImageKey = GlobalKey();

  Widget _buildBackgroundImage(BuildContext context) {
    return Positioned.fill(
        child: Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          'https:${game.cover!.url}'.replaceFirst('t_thumb', 't_cover_big_2x'),
          fit: BoxFit.cover,
          key: _backgroundImageKey,
        ),
      ],
    ));
  }

  Widget _buildTitle() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Text(
        game.name,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AspectRatio(
        aspectRatio: 9 / 10,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(CustomPageRoute(
              builder: (context) => GamePage(game: game),
            )),
            child: Stack(
              children: [
                _buildBackgroundImage(context),
                _buildGradient(),
                _buildTitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class BackgroundImage extends StatelessWidget {
//   const BackgroundImage({
//     super.key,
//     required this.game,
//   });

//   final Game game;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: Image.network(
//         'https:${game.cover!.url}'.replaceFirst('t_thumb', 't_cover_big_2x'),
//         // width: 140,
//         fit: BoxFit.fitWidth,
//       ),
//     );
//   }
// }
