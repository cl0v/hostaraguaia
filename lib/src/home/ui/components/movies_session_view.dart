import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/components/movies_grid_view.dart';
import '../blocs/search_bloc.dart';
import '../states/search_movies_states.dart';

class MoviesSessionView extends StatelessWidget {
  const MoviesSessionView({super.key});

  _isIOS() {
    if (kIsWeb) {
      return false;
    }
    return Platform.isIOS;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchMoviesStates>(
        builder: (context, state) {
      if (state is SearchMoviesLoadingState) {
        return Center(
          child: _isIOS()
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
