part of 'search_bloc.dart';

enum MoviesStatus { initial, success, failure }

final class SearchMoviesStates extends Equatable {
  final MoviesStatus status;
  final List<MovieCardEntity> movies;
  final bool hasReachedMax;

  const SearchMoviesStates({
    this.status = MoviesStatus.initial,
    this.movies = const <MovieCardEntity>[],
    this.hasReachedMax = false,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
  SearchMoviesStates copyWith({
    MoviesStatus? status,
    List<MovieCardEntity>? movies,
    bool? hasReachedMax,
  }) {
    return SearchMoviesStates(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
