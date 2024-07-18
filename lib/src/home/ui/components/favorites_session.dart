import 'package:flutter/material.dart';

import '../../domain/entities/movie_card_entity.dart';
import 'movie_card.dart';

class FavoritesSessionComponent extends StatefulWidget {
  const FavoritesSessionComponent({
    super.key,
    required this.movies,
  });

  final List<MovieCardEntity> movies;

  @override
  State<FavoritesSessionComponent> createState() =>
      _FavoritesSessionComponentState();
}

class _FavoritesSessionComponentState extends State<FavoritesSessionComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: MovieCardComponent(
          movie: widget.movies[index],
        ),
      ),
    );
  }
}
