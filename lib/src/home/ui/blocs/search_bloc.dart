import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie_card_entity.dart';
import '../../domain/repositories/search_movies_repository.dart';

sealed class SearchMoviesStates {}

class SearchMoviesLoadingState extends SearchMoviesStates {}

class SearchMoviesErrorState extends SearchMoviesStates {
  final String message;
  SearchMoviesErrorState(this.message);
}

class MoviesNotFoundState extends SearchMoviesStates {}

class SearchMoviesSuccessState extends SearchMoviesStates {
  final List<MovieCardEntity> movies;
  SearchMoviesSuccessState(this.movies);
}

class SearchBloc extends Bloc<String, SearchMoviesStates> {
  ISearchMoviesRepository repository;

  SearchBloc(this.repository) : super(SearchMoviesLoadingState()) {
    on<String>((event, emit) async {
      emit(SearchMoviesLoadingState());
      try {
        final response = await repository.searchMovies(event);
        if (response.isEmpty) {
          emit(MoviesNotFoundState());
          return;
        }
        emit(SearchMoviesSuccessState(response));
      } catch (e) {
        emit(SearchMoviesErrorState(e.toString()));
      }
    });
  }
}
