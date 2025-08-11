import 'package:json_annotation/json_annotation.dart';

part 'term_result_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TermResultDTO {
  TermResultDTO({required this.id});

  final int id;

  static TermResultDTO fromJson(Map<String, dynamic> source) =>
      _$TermResultDTOFromJson(source);

  Map<String, dynamic> toJson() => _$TermResultDTOToJson(this);
}
