// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCardModel _$MovieCardModelFromJson(Map<String, dynamic> json) =>
    MovieCardModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterUrl: json['poster_url'] as String,
    );

Map<String, dynamic> _$MovieCardModelToJson(MovieCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_url': instance.posterUrl,
    };
