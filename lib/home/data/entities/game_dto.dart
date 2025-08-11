// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'game_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GameDTO {
  const GameDTO({
    required this.id,
    required this.name,
    required this.summary,
    required this.rating,
    required this.ratingCount,
    required this.cover,
    required this.firstReleaseDate,
    required this.screenshots,
    required this.themes,
    required this.artworks,
    required this.videos,
  });

  final int id;
  final String name;
  final String? summary;
  final double? rating;
  final int? ratingCount;
  final int? cover;
  final int? firstReleaseDate;
  final List<int>? screenshots;
  final List<int>? themes;
  final List<int>? artworks;
  final List<int>? videos;

  static GameDTO fromJson(Map<String, dynamic> source) =>
      _$GameDTOFromJson(source);

  Map<String, dynamic> toJson() => _$GameDTOToJson(this);
}
