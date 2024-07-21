import 'package:dio/dio.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../models/movie_details_model.dart';

abstract class IMovieDetailshDataSource {
  Future<MovieDetailsEntity> fetchMovieDetails(int id);
}

class WatchmodeDatasourceImpl implements IMovieDetailshDataSource {
  final Dio client;

  WatchmodeDatasourceImpl({
    required this.client,
  });

  @override
  Future<MovieDetailsEntity> fetchMovieDetails(int id) async {
    final r = await client.get(
      'https://api.watchmode.com/v1/title/$id/details/?apiKey=d3zoPV8N1CaODZhNAQ6H22JdOQAVmlmyjtVDIGb6&append_to_response=sources',
    );
    
    final model = MovieDetailsModel.fromJson(r.data);
    return model;
  }
}
