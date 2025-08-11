import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageDTO {
  ImageDTO(
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

  static ImageDTO fromJson(Map<String, dynamic> source) =>
      _$ImageDTOFromJson(source);

  Map<String, dynamic> toJson() => _$ImageDTOToJson(this);
}
