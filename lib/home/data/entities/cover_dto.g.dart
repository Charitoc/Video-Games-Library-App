// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverDTO _$CoverDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CoverDTO',
      json,
      ($checkedConvert) {
        final val = CoverDTO(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          game: $checkedConvert('game', (v) => (v as num).toInt()),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CoverDTOToJson(CoverDTO instance) => <String, dynamic>{
      'id': instance.id,
      'game': instance.game,
      'url': instance.url,
    };
