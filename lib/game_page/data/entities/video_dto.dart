import 'package:json_annotation/json_annotation.dart';

part 'video_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoDTO {
  VideoDTO({
    required this.id,
    required this.game,
    required this.name,
    required this.videoId,
  });

  final int id;
  final int game;
  final String name;
  final String videoId;

  static VideoDTO fromJson(Map<String, dynamic> source) =>
      _$VideoDTOFromJson(source);

  Map<String, dynamic> toJson() => _$VideoDTOToJson(this);
}
