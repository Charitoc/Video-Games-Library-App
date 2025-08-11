import 'package:json_annotation/json_annotation.dart';

part 'theme_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ThemeDTO {
  ThemeDTO(
      {required this.name,
      });

  final String name;

  static ThemeDTO fromJson(Map<String, dynamic> source) =>
      _$ThemeDTOFromJson(source);

  Map<String, dynamic> toJson() => _$ThemeDTOToJson(this);
}
