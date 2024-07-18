import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';

import '../blocs/search_bloc.dart';
import 'movie_card.dart';

class MoviesSessionComponent extends StatelessWidget {
  const MoviesSessionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchMoviesStates>(
        builder: (context, state) {
      if (state is SearchMoviesLoadingState) {
        return Center(
          child: Platform.isIOS
              ? const CupertinoActivityIndicator()
              : const CircularProgressIndicator(),
        );
      } else if (state is MoviesNotFoundState) {
        return const Center(
          child: Text('Nenhum filme encontrado'),
        );
      } else if (state is SearchMoviesErrorState) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is SearchMoviesSuccessState) {
        return MoviesGridViewComponent(
          movies: state.movies,
        );
      } else {
        return const Center(
          child: Text('Ocorreu um erro, tente novamente mais tarde!'),
        );
      }
    });
  }
}

class MoviesGridViewComponent extends StatefulWidget {
  const MoviesGridViewComponent({
    super.key,
    required this.movies,
  });

  final List<MovieCardEntity> movies;

  @override
  State<MoviesGridViewComponent> createState() =>
      _MoviesGridViewComponentState();
}

class _MoviesGridViewComponentState extends State<MoviesGridViewComponent> {
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
