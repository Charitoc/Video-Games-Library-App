// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDTO _$VideoDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      'VideoDTO',
      json,
      ($checkedConvert) {
        final val = VideoDTO(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          game: $checkedConvert('game', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          videoId: $checkedConvert('video_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'videoId': 'video_id'},
    );

Map<String, dynamic> _$VideoDTOToJson(VideoDTO instance) => <String, dynamic>{
      'id': instance.id,
      'game': instance.game,
      'name': instance.name,
      'video_id': instance.videoId,
    };
