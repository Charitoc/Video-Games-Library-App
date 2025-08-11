import 'package:flutter/material.dart';

class HomePageLoadingView extends StatefulWidget {
  const HomePageLoadingView({super.key});

  @override
  State<HomePageLoadingView> createState() => _HomePageLoadingViewState();
}

class _HomePageLoadingViewState extends State<HomePageLoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat(count: 3);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: RotationTransition(
          turns: _controller,
          child: Center(child: Image.asset('assets/logo.png'))),
    );
  }
}
