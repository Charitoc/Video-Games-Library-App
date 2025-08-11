// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igdb_app/common/helpers/space.dart';
import 'package:igdb_app/custom_page_route.dart';
import 'package:igdb_app/game_page/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({
    super.key,
    required this.video,
  });

  final Video video;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.video.videoId);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          disableDragSeek: true,
          forceHD: true,
          controlsVisibleAtStart: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 3 / 4;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          width: width,
          bottomActions: [
            const CurrentPosition(),
            Space.horizontalXS,
            const ProgressBar(isExpanded: true),
            Space.horizontalXS,
            const RemainingDuration(),
            GestureDetector(
              onTap: () {
                _controller.pause();
                Navigator.of(context).push(CustomPageRoute(
                  builder: (context) => MyWidget(
                    controller: _controller,
                  ),
                ));
              },
              child: Icon(Icons.fullscreen),
            ),
          ],
        ),
        builder: (context, player) {
          return Scaffold(
            body: SizedBox(
              child: player,
            ),
          );
        },
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.controller});

  final YoutubePlayerController controller;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // widget.controller.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.toggleFullScreenMode();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: widget.controller,
        bottomActions: [
          Space.horizontalML,
          const CurrentPosition(),
          Space.horizontalXS,
          const ProgressBar(isExpanded: true),
          Space.horizontalXS,
          const RemainingDuration(),
          GestureDetector(
              onTap: () {
                widget.controller.toggleFullScreenMode();
                Navigator.of(context).pop();
              },
              child: Icon(Icons.fullscreen)),
          Space.horizontalML,
        ],
      ),
    );
  }
}
