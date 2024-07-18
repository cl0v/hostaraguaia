import 'package:flutter/material.dart';
import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';

import 'movie_card.dart';

class CustomGridViewComponent extends StatefulWidget {
  const CustomGridViewComponent({
    super.key,
    required this.movies,
  });

  final List<MovieCardEntity> movies;

  @override
  State<CustomGridViewComponent> createState() =>
      _CustomGridViewComponentState();
}

class _CustomGridViewComponentState extends State<CustomGridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Para desativar a rolagem do GridView
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 185 / 278,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) => MovieCardComponent(
        movie: widget.movies[index],
      ),
      itemCount: widget.movies.length,
    );
  }
}
