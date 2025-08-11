// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igdb_app/custom_page_route.dart';
import 'package:igdb_app/game_page/views/image_fullscreen_view.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.index,
    required this.screenshotList,
  });

  final int index;
  final List<String> screenshotList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(CustomPageRoute(
        builder: (context) => ImageFullscreenView(
          initialIndex: index,
          screenshotList: screenshotList,
        ),
      )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: screenshotList[index].hashCode,
          child: Image.network(
            'https:${screenshotList[index]}'
                .replaceFirst('t_thumb', 't_cover_big_2x'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
