
import '../../domain/entities/movie_card_entity.dart';

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
