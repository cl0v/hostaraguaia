import 'package:flutter/widgets.dart';

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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 185 / 278,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) => MovieCardComponent(
        movie: movies[index],
      ),
      itemCount: movies.length,
    );
  }
}
