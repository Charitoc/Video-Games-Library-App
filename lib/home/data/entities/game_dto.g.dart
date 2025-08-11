// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDTO _$GameDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GameDTO',
      json,
      ($checkedConvert) {
        final val = GameDTO(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          summary: $checkedConvert('summary', (v) => v as String?),
          rating: $checkedConvert('rating', (v) => (v as num?)?.toDouble()),
          ratingCount:
              $checkedConvert('rating_count', (v) => (v as num?)?.toInt()),
          cover: $checkedConvert('cover', (v) => (v as num?)?.toInt()),
          firstReleaseDate: $checkedConvert(
              'first_release_date', (v) => (v as num?)?.toInt()),
          screenshots: $checkedConvert(
              'screenshots',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          themes: $checkedConvert(
              'themes',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          artworks: $checkedConvert(
              'artworks',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          videos: $checkedConvert(
              'videos',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'ratingCount': 'rating_count',
        'firstReleaseDate': 'first_release_date'
      },
    );

Map<String, dynamic> _$GameDTOToJson(GameDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'summary': instance.summary,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'cover': instance.cover,
      'first_release_date': instance.firstReleaseDate,
      'screenshots': instance.screenshots,
      'themes': instance.themes,
      'artworks': instance.artworks,
      'videos': instance.videos,
    };
