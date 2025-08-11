import 'package:json_annotation/json_annotation.dart';

part 'artwork_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ArtworkDTO {
  ArtworkDTO(
      {required this.id,
      required this.game,
      required this.height,
      required this.imageId,
      required this.url,
      required this.width});

  final int id;
  final int game;
  final int height;
  final String imageId;
  final String url;
  final int width;

  static ArtworkDTO fromJson(Map<String, dynamic> source) =>
      _$ArtworkDTOFromJson(source);

  Map<String, dynamic> toJson() => _$ArtworkDTOToJson(this);
}
