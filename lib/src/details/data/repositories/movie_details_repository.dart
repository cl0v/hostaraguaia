import 'package:hostaraguaia/src/details/data/datasources/watchmode_datasource.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';

class MovieDetailsRepository implements IMovieDetailsRepository{
  MovieDetailsRepository({
    required this.dataSource
  });

  IMovieDetailshDataSource dataSource;
  @override
  Future<MovieDetailsEntity> fetchMovieDetails(int id) =>dataSource.fetchMovieDetails(id);
}