import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_game_dto.g.dart';

@JsonSerializable()
class PopularGameDTO extends Equatable {
  const PopularGameDTO({
    required this.id,
    required this.gameId,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'game_id')
  final int gameId;

  @override
  List<Object?> get props => [
        id,
        gameId,
      ];

  static PopularGameDTO fromJson(Map<String, dynamic> source) =>
      _$PopularGameDTOFromJson(source);

  Map<String, dynamic> toJson() => _$PopularGameDTOToJson(this);
}
