import '../../../home/domain/entities/movie_card_entity.dart';

abstract class IFavoritesRepository {
  Future<void> addFavorite(MovieCardEntity movie);
  Future<List<MovieCardEntity>> getFavorites();
  Future<void> deleteFavorite(int id);
}
