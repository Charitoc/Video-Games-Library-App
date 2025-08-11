// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:igdb_app/home/models/cover.dart';

class Game extends Equatable {
  const Game({
    required this.id,
    required this.name,
    required this.description,
    required this.coverUrl,
    required this.rating,
    required this.ratingCount,
    required this.firstReleaseDate,
    required this.cover,
    required this.screenshots,
    required this.themeIds,
    required this.artworks,
    required this.videos,
  });

  final int id;
  final String name;
  final String description;
  final String? coverUrl;
  final double rating;
  final int ratingCount;
  final DateTime? firstReleaseDate;
  final Cover? cover;
  final List<int> screenshots;
  final List<int> themeIds;
  final List<int> artworks;
  final List<int> videos;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        coverUrl,
        cover,
        screenshots,
        themeIds,
        artworks,
        videos,
      ];

  Game copyWith({
    int? id,
    String? name,
    String? description,
    String? coverUrl,
    double? rating,
    int? ratingCount,
    DateTime? firstReleaseDate,
    Cover? cover,
    List<int>? screenshots,
    List<int>? themeIds,
    List<int>? artworks,
    List<int>? videos,
  }) {
    return Game(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      coverUrl: coverUrl ?? this.coverUrl,
      rating: rating ?? this.rating,
      ratingCount: ratingCount ?? this.ratingCount,
      firstReleaseDate: firstReleaseDate ?? this.firstReleaseDate,
      cover: cover ?? this.cover,
      screenshots: screenshots ?? this.screenshots,
      themeIds: themeIds ?? this.themeIds,
      artworks: artworks ?? this.artworks,
      videos: videos ?? this.videos,
    );
  }
}
