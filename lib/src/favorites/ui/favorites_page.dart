import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';
import 'package:hostaraguaia/src/favorites/ui/blocs/favorite_bloc.dart';
import 'package:hostaraguaia/src/utils/components/movies_grid_view.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(ListFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: BlocBuilder<FavoriteBloc, List<MovieCardEntity>>(
            builder: (context, state) {
          return MoviesGridViewComponent(
            movies: state,
          );
        }),
      ),
    );
  }
}
