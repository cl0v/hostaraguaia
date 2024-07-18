import '../entities/movie_card_entity.dart';

abstract class ISearchMoviesRepository {

  Future<List<MovieCardEntity>> searchMovies(String query);

}