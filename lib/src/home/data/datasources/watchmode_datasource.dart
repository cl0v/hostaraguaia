import 'package:dio/dio.dart';
import 'package:hostaraguaia/src/http/keys.dart';

abstract class IMoviesSearchDataSource {
  Future<List<dynamic>> searchMovies(String query);
}

class WatchModeDataSourceImpl implements IMoviesSearchDataSource {
  final Dio client;

  const WatchModeDataSourceImpl(this.client);

  @override
  Future<List> searchMovies(String query) async {
    final r = await client.get('https://api.watchmode.com/v1/releases/?apiKey=$watchmode_api_key');
    return r.data;
  }
}
