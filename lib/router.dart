import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:igdb_app/home/views/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      //   routes: <RouteBase>[
      //     GoRoute(
      //       path: 'details',
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const DetailsScreen();
      //       },
      //     ),
      //   ],
    ),
  ],
);
