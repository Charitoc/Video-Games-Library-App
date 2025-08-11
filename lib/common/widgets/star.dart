import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final double rating; // from 0 to 100
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const Star({
    super.key,
    required this.rating,
    this.size = 48.0,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    double fillFraction = (rating.clamp(0, 100)) / 100;

    return Stack(
      children: [
        Icon(Icons.star, size: size, color: emptyColor),
        ClipRect(
          clipper: _PartialClipper(fillFraction),
          child: Icon(Icons.star, size: size, color: filledColor),
        ),
      ],
    );
  }
}

class _PartialClipper extends CustomClipper<Rect> {
  final double fraction;

  _PartialClipper(this.fraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fraction, size.height);
  }

  @override
  bool shouldReclip(_PartialClipper oldClipper) =>
      oldClipper.fraction != fraction;
}
