// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeDTO _$ThemeDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ThemeDTO',
      json,
      ($checkedConvert) {
        final val = ThemeDTO(
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ThemeDTOToJson(ThemeDTO instance) => <String, dynamic>{
      'name': instance.name,
    };
