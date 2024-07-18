import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';
import 'package:hostaraguaia/src/home/domain/repositories/search_movies_repository.dart';

import '../datasources/watchmode_datasource.dart';

class SearchMoviesRepository implements ISearchMoviesRepository {
  SearchMoviesRepository({required this.dataSource});

  IMoviesSearchDataSource dataSource;

  @override
  Future<List<MovieCardEntity>> searchMovies(String query) =>
      dataSource.searchMovies(query);
}
