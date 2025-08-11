// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_game_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularGameDTO _$PopularGameDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PopularGameDTO',
      json,
      ($checkedConvert) {
        final val = PopularGameDTO(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          gameId: $checkedConvert('game_id', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'gameId': 'game_id'},
    );

Map<String, dynamic> _$PopularGameDTOToJson(PopularGameDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
    };
