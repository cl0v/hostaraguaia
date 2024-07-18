import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieCardModel extends MovieCardEntity {
  MovieCardModel({
    required super.id,
    required super.title,
    required super.posterUrl,
  });

  @override
  @JsonKey(name: 'poster_url')
  get posterUrl => super.posterUrl;

  factory MovieCardModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCardModelFromJson(json);
}
