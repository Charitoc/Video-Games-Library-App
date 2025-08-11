import 'package:equatable/equatable.dart';

class PopularGame extends Equatable {
  const PopularGame({required this.id, required this.gameId});

  final int id;
  final String gameId;

  @override
  List<Object?> get props => [
        id,
        gameId,
      ];
}
