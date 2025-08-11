import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cover_dto.g.dart';

@JsonSerializable()
class CoverDTO extends Equatable {
  const CoverDTO({
    required this.id,
    required this.game,
    required this.url,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'game')
  final int game;
  @JsonKey(name: 'url')
  final String url;

  @override
  List<Object?> get props => [
        id,
        game,
        url,
      ];

  static CoverDTO fromJson(Map<String, dynamic> source) =>
      _$CoverDTOFromJson(source);

  Map<String, dynamic> toJson() => _$CoverDTOToJson(this);
}
