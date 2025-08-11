import 'package:equatable/equatable.dart';

class GameTheme extends Equatable {
  final String name;

  const GameTheme({required this.name});

  @override
  List<Object?> get props => [name];
}
