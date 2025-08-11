import 'package:equatable/equatable.dart';

class Video extends Equatable {
  const Video(
      {required this.id,
      required this.game,
      required this.name,
      required this.videoId});

  final int id;
  final int game;
  final String name;
  final String videoId;

  @override
  List<Object?> get props => [id, game, name, videoId];
}
