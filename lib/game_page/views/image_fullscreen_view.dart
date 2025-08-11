// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igdb_app/common/helpers/space.dart';

class ImageFullscreenView extends StatefulWidget {
  const ImageFullscreenView({
    super.key,
    required this.initialIndex,
    required this.screenshotList,
  });

  final int initialIndex;
  final List<String> screenshotList;

  @override
  State<ImageFullscreenView> createState() => _ImageFullscreenViewState();
}

class _ImageFullscreenViewState extends State<ImageFullscreenView> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.screenshotList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  onVerticalDragStart: (details) => Navigator.of(context).pop(),
                  child: Hero(
                      tag: widget.screenshotList[widget.initialIndex].hashCode,
                      child: Image.network(
                        'https:${widget.screenshotList[index]}'
                            .replaceFirst('t_thumb', 't_cover_big_2x'),
                        fit: BoxFit.fitWidth,
                      )),
                ),
                Space.verticalSM,
                Text('${index + 1} / ${widget.screenshotList.length}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
