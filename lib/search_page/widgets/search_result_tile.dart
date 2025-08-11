// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igdb_app/common/models/game.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    super.key,
    required this.game,
    required this.onTap,
  });

  final Game game;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFE6B56C)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              game.name,
              style: TextStyle(color: Color(0xFF2A3A59)),
            ),
          ),
        ),
      ),
    );
  }
}
