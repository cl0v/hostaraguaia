import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/search_movies_repository.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/movie_card_entity.dart';

part 'search_states.dart';

class SearchBloc extends Bloc<String, SearchMoviesStates> {
  ISearchMoviesRepository repository;

  SearchBloc(this.repository) : super(const SearchMoviesStates()) {
    on<String>((event, emit) async {
      if (state.hasReachedMax) return;
      try {
        if (state.status == MoviesStatus.initial ||
            state.searchFieldText != event) {
          final movies = await repository.searchMovies(event);
          return emit(state.copyWith(
            searchFieldText: event,
            status: MoviesStatus.success,
            movies: movies,
            hasReachedMax: false,
          ));
        }
        final movies = await repository.searchMovies(event);
        emit(movies.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                searchFieldText: event,
                status: MoviesStatus.success,
                movies: List.of(state.movies)..addAll(movies),
                hasReachedMax: false,
              ));
      } catch (e) {
        emit(state.copyWith(status: MoviesStatus.failure));
      }
    });
  }
}
