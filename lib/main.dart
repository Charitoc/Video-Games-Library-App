// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:igdb_api/remote_client.dart';
import 'package:igdb_app/game_page/data/game_page_repository.dart';
import 'package:igdb_app/game_page/data/src/game_page_remote_ds.dart';
import 'package:igdb_app/home/data/home_repository.dart';
import 'package:igdb_app/home/data/src/home_remote_ds.dart';
import 'package:igdb_app/router.dart';
import 'package:igdb_app/search_page/data/search_repository.dart';
import 'package:igdb_app/search_page/data/src/search_remote_ds.dart';
import 'package:igdb_app/shared_preferences_token_storage.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ThemeData> loadThemeFromAsset(String path) async {
  final raw = await rootBundle.loadString(path);
  final Map<String, dynamic> jsonMap = jsonDecode(raw);
  final theme = ThemeDecoder.decodeThemeData(jsonMap);
  if (theme == null) {
    // fallback if decode fails
    return ThemeData.light();
  }
  return theme;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();
  final tokenStorage = SharedPreferencesTokenStorage(sharedPrefs);
  final remoteApiClient =
      RemoteApiClientImplementation(tokenStorage: tokenStorage);
  final gamePageRemoteDs = GamePageRemoteDs(remoteApiClient);
  final gamePageRepository = GamePageRepository(gamePageRemoteDs);
  final homeRemoteDS = HomeRemoteDS(remoteApiClient);
  final homeRepository = HomeRepository(homeRemoteDS);
  final searchRemoteDs = SearchRemoteDs(remoteApiClient);
  final searchRepository = SearchRepository(searchRemoteDs);

  final theme = ThemeData(
    // textTheme: TextTheme(),
    colorScheme: ColorScheme.dark(),
    scaffoldBackgroundColor: Color(0xff0F1B2B),
  );

  await dotenv.load(fileName: ".env");

  runApp(App(
    homeRepository: homeRepository,
    searchRepository: searchRepository,
    gamePageRepository: gamePageRepository,
    tokenStorage: tokenStorage,
    theme: theme,
  ));
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.homeRepository,
    required this.searchRepository,
    required this.gamePageRepository,
    required this.tokenStorage,
    required this.theme,
  });
  final HomeRepository homeRepository;
  final SearchRepository searchRepository;
  final GamePageRepository gamePageRepository;
  final SharedPreferencesTokenStorage tokenStorage;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => homeRepository,
        ),
        RepositoryProvider(
          create: (context) => searchRepository,
        ),
        RepositoryProvider(
          create: (context) => gamePageRepository,
        ),
        RepositoryProvider(
          create: (context) => tokenStorage,
        )
      ],
      child: AppView(
        theme: theme,
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key, required this.theme});

  final ThemeData theme;

  // Future<ThemeData> getTheme() async {
  //   final themeStr = await rootBundle.loadString('lib/theme.json');
  //   final themeJson = json.decode(themeStr);
  //   return ThemeDecoder.decodeThemeData(
  //         themeJson,
  //         validate: true,
  //       ) ??
  //       ThemeData();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, title: 'Flutter Demo', theme: theme,
      debugShowCheckedModeBanner: false,
      //   appBarTheme: AppBarTheme(color: Color()),
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      //   scaffoldBackgroundColor: Colors.blueGrey,
      //   useMaterial3: true,
      // ),
    );
  }
}
