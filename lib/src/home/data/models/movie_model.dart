import 'package:hostaraguaia/src/home/domain/entities/movie_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieCardReleasesModel extends MovieCardEntity {
  MovieCardReleasesModel({
    required super.id,
    required super.title,
    required super.posterUrl,
  });

  @override
  @JsonKey(name: 'poster_url')
  get posterUrl => super.posterUrl;

  factory MovieCardReleasesModel.fromEntity(MovieCardEntity entity) {
    return MovieCardReleasesModel(
      id: entity.id,
      title: entity.title,
      posterUrl: entity.posterUrl,
    );
  }

  factory MovieCardReleasesModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCardReleasesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCardReleasesModelToJson(this);
}

@JsonSerializable()
class MovieCardModel extends MovieCardEntity {
  MovieCardModel({
    required super.id,
    required super.title,
    required super.posterUrl,
  });

  @override
  @JsonKey(name: 'image_url')
  get posterUrl => super.posterUrl;
  @override
  @JsonKey(name: 'name')
  get title => super.title;

  factory MovieCardModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCardModelFromJson(json);
}
