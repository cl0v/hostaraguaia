import 'package:dio/dio.dart';
import 'package:hostaraguaia/src/home/data/models/movie_model.dart';
import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';
import 'package:hostaraguaia/src/http/keys.dart';

abstract class IMoviesSearchDataSource {
  Future<List<MovieCardEntity>> searchMovies(String query);
}

class WatchModeDataSourceImpl implements IMoviesSearchDataSource {
  final Dio client;

  const WatchModeDataSourceImpl(this.client);

  @override
  Future<List<MovieCardEntity>> searchMovies(String query) async {
    if (query.isEmpty) {
      return _listReleases();
    }
    final url = Uri.parse(
      'https://api.watchmode.com/v1/autocomplete-search/?apiKey=$watchmode_api_key&search_value=$query&search_type=3',
    ).toString();
    final r = await client.get(url);
    List<MovieCardEntity> movies = [];
    for (var item in r.data['results']) {
      if (item['image_url'] == null ||
          item['image_url'] == '' ||
          item['image_url'] == 'https://cdn.watchmode.com/posters/blank.gif') {
        continue;
      }
      movies.add(MovieCardModel.fromJson(item));
    }
    return movies;
    // curl -i 'https://api.watchmode.com/v1/autocomplete-search/?apiKey=$watchmode_api_key&search_value=$query&search_type=3'
  }

  Future<List<MovieCardEntity>> _listReleases() async {
    final r = await client.get(
      'https://api.watchmode.com/v1/releases/?apiKey=$watchmode_api_key',
    );
    List<MovieCardEntity> movies = [];
    for (var item in r.data['releases']) {
      if (item['poster_url'] == null ||
          item['poster_url'] == '' ||
          item['poster_url'] == 'https://cdn.watchmode.com/posters/blank.gif') {
        continue;
      }
      movies.add(MovieCardReleasesModel.fromJson(item));
    }
    return movies;
  }
}
