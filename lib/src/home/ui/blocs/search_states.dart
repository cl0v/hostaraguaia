part of 'search_bloc.dart';

enum MoviesStatus { initial, success, failure }

final class SearchMoviesStates extends Equatable {
  final String searchFieldText;
  final MoviesStatus status;
  final List<MovieCardEntity> movies;
  final bool hasReachedMax;

  const SearchMoviesStates({
    this.searchFieldText = '',
    this.status = MoviesStatus.initial,
    this.movies = const <MovieCardEntity>[],
    this.hasReachedMax = false,
  });

  @override
  List<Object?> get props => [searchFieldText, status, movies, hasReachedMax];
  SearchMoviesStates copyWith({
    String? searchFieldText,
    MoviesStatus? status,
    List<MovieCardEntity>? movies,
    bool? hasReachedMax,
  }) {
    return SearchMoviesStates(
        searchFieldText: searchFieldText ?? this.searchFieldText,
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
