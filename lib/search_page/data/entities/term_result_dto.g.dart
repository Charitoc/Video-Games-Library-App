// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermResultDTO _$TermResultDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TermResultDTO',
      json,
      ($checkedConvert) {
        final val = TermResultDTO(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TermResultDTOToJson(TermResultDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
