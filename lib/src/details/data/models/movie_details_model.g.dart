// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      title: json['title'] as String,
      imageUrl: json['poster'] as String,
      overview: json['plot_overview'] as String,
      year: (json['year'] as num).toInt(),
      rating: (json['user_rating'] as num).toDouble(),
      streamingAppsModel:
          MovieDetailsModel._streamingAppsFromJson(json['sources'] as List),
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'sources': instance.streamingAppsModel,
      'plot_overview': instance.overview,
      'user_rating': instance.rating,
      'poster': instance.imageUrl,
    };

StreamingAppsModel _$StreamingAppsModelFromJson(Map<String, dynamic> json) =>
    StreamingAppsModel(
      name: json['name'] as String,
      url: json['web_url'] as String,
    );

Map<String, dynamic> _$StreamingAppsModelToJson(StreamingAppsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'web_url': instance.url,
    };
