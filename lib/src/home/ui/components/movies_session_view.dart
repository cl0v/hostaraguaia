import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/components/movies_grid_view.dart';
import '../blocs/search_bloc.dart';

class MoviesSessionView extends StatelessWidget {
  const MoviesSessionView({super.key});

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