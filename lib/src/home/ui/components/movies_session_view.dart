import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/components/movies_grid_view.dart';
import '../blocs/search_bloc.dart';

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
      switch (state.status) {
        case MoviesStatus.initial:
          return Center(
            child: _isIOS()
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
          );
        case MoviesStatus.success:
          return MoviesGridViewComponent(
            movies: state.movies,
          );
        case MoviesStatus.failure:
          return const Center(
            child: Text('Ocorreu um erro, tente novamente mais tarde!'),
          );

        default:
          return const Center(
            child: Text('Nenhum filme encontrado'),
          );
      }
    });
  }
}
