// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Cover extends Equatable {
  const Cover({
    required this.id,
    required this.game,
    required this.url,
  });

  final int id;
  final int game;
  final String url;

  @override
  List<Object?> get props => [
        id,
        game,
        url,
      ];
}
