// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDTO _$ImageDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ImageDTO',
      json,
      ($checkedConvert) {
        final val = ImageDTO(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          game: $checkedConvert('game', (v) => (v as num).toInt()),
          height: $checkedConvert('height', (v) => (v as num).toInt()),
          imageId: $checkedConvert('image_id', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
          width: $checkedConvert('width', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'imageId': 'image_id'},
    );

Map<String, dynamic> _$ImageDTOToJson(ImageDTO instance) => <String, dynamic>{
      'id': instance.id,
      'game': instance.game,
      'height': instance.height,
      'image_id': instance.imageId,
      'url': instance.url,
      'width': instance.width,
    };
