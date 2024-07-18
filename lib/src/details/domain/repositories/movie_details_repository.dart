import '../entities/movie_details_entity.dart';

abstract class IMovieDetailsRepository {
  Future<MovieDetailsEntity> fetchMovieDetails(int id);
}