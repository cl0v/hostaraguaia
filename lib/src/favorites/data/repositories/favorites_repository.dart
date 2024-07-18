import 'package:hostaraguaia/src/favorites/data/services/hive_database_service.dart';
import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';

import '../../domain/repositories/favorites_repository.dart';

class FavoritesRepository implements IFavoritesRepository {
  final FavoritesDatabaseService service;

  FavoritesRepository({required this.service});
  @override
  Future<void> addFavorite(MovieCardEntity movie) => service.addFavorite(movie);
  @override
  Future<void> deleteFavorite(int id) => service.deleteFavorite(id);
  @override
  Future<List<MovieCardEntity>> getFavorites() => service.getFavorites();
}
