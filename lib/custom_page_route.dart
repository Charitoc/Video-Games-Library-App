import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Stack(
      children: [
        FadeTransition(
          opacity: ReverseAnimation(secondaryAnimation),
          child: Container(
            color: Color(0xff0F1B2B),
          ),
        ),
        FadeTransition(
          opacity: animation,
          child: child,
        ),
      ],
    );
  }
}
