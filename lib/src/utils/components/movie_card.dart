import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';

import '../../details/ui/details_page.dart';
import '../../favorites/ui/blocs/favorite_bloc.dart';

class MovieCardComponent extends StatelessWidget {
  const MovieCardComponent({
    super.key,
    required this.movie,
  });
  final MovieCardEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, List<MovieCardEntity>>(
        builder: (context, state) {
      bool isFavorite = false;
      if (state.map<int>((e) => e.id).toList().contains(movie.id)) {
        isFavorite = true;
      }
      return Stack(
        children: [
          GestureDetector(
            child: Image.network(
              movie.posterUrl,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailsPage(movie: movie)),
            ),
          ),
          IconButton(
            onPressed: () {
              if (!isFavorite) {
                context.read<FavoriteBloc>().add(AddToFavoritesEvent(movie));
              } else {
                context
                    .read<FavoriteBloc>()
                    .add(RemoveFromFavoritesEvent(movie.id));
              }
            },
            color: isFavorite ? Colors.red : Colors.grey,
            icon: const Icon(
              Icons.favorite,
            ),
          )
        ],
      );
    });
  }
}
