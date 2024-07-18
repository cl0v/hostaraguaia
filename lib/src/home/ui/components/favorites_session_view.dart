import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_card_entity.dart';
import '../../../favorites/ui/blocs/favorite_bloc.dart';
import '../../../utils/components/movie_card.dart';

class FavoritesSessionComponent extends StatelessWidget {
  const FavoritesSessionComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Meus Favoritos'),
      backgroundColor: Colors.red[50],
      children: [
        BlocBuilder<FavoriteBloc, List<MovieCardEntity>>(
            builder: (context, state) {
          if (state.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: const Center(
                child: Text(
                  'Nenhum item adicionado aos Favoritos',
                ),
              ),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: FavoritesComponent(
              movies: state,
            ),
          );
        }),
      ],
    );
  }
}

class FavoritesComponent extends StatelessWidget {
  const FavoritesComponent({
    super.key,
    required this.movies,
  });
  final List<MovieCardEntity> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: MovieCardComponent(
          movie: movies[index],
        ),
      ),
    );
  }
}
