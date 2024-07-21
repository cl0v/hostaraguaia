import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/search_movies_repository.dart';
import '../states/search_movies_states.dart';

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
