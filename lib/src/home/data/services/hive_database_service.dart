import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hostaraguaia/src/home/data/models/movie_model.dart';

import '../../domain/entities/movie_card_entity.dart';

abstract class FavoritesDatabaseService {
  Future<List<MovieCardEntity>> getFavorites();

  Future<void> addFavorite(MovieCardEntity movie);

  Future<void> deleteFavorite(int id);
}

class HiveDatabaseService implements FavoritesDatabaseService {
  static const String boxName = 'favorites';

  const HiveDatabaseService();

  @override
  Future<void> addFavorite(MovieCardEntity movie) async {
    var box = Hive.box(boxName);
    return await box.put(movie.id, jsonEncode(MovieCardModel.fromEntity(movie).toJson()));
  }

  @override
  Future<void> deleteFavorite(id) {
    var box = Hive.box(boxName);
    return box.delete(id);
  }

  @override
  Future<List<MovieCardEntity>> getFavorites() async {
    var box = Hive.box(boxName);
    var list = <MovieCardEntity>[];
    print(box.keys);

    for (var id in box.keys) {
      final data = await box.get(id);
      final entity = MovieCardModel.fromJson(jsonDecode(data));
      list.add(entity);
    }

    return list;
  }
}
