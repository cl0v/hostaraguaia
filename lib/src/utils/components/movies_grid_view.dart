import 'package:flutter/widgets.dart';
import 'package:hostaraguaia/src/utils/computed/grid_cards_count.dart';

import '../../home/domain/entities/movie_card_entity.dart';
import 'movie_card.dart';

class MoviesGridViewComponent extends StatelessWidget {
  const MoviesGridViewComponent({
    super.key,
    required this.movies,
  });

  final List<MovieCardEntity> movies;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isWide = constraints.maxWidth > 756;
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCardsCount(constraints.maxWidth, isWide),
          childAspectRatio: 185 / 278,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) => MovieCardComponent(
          movie: movies[index],
        ),
        itemCount: movies.length,
      );
    });
  }
}
