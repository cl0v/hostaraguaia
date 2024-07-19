import 'package:hostaraguaia/src/details/domain/entities/movie_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.title,
    required super.imageUrl,
    required super.overview,
    required super.year,
    required super.rating,
    required this.streamingAppsModel,
  }) : super(streamingApps: streamingAppsModel);

  @JsonKey(name: 'sources', fromJson: _streamingAppsFromJson)
  final List<StreamingAppsModel> streamingAppsModel;

  @override
  @JsonKey(name: "plot_overview")
  get overview => super.overview;

  @override
  @JsonKey(name: "user_rating", defaultValue: 0)
  get rating => super.rating;

  @override
  @JsonKey(name: "poster")
  get imageUrl => super.imageUrl;

  static List<StreamingAppsModel> _streamingAppsFromJson(List<dynamic> list) =>
      list.map((e) => StreamingAppsModel.fromJson(e)).toList();

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);
}

@JsonSerializable()
class StreamingAppsModel extends StreamingAppsEntity {
  StreamingAppsModel({
    required super.name,
    required super.url,
  });

  @override
  @JsonKey(name: "web_url")
  get url => super.url;

  factory StreamingAppsModel.fromJson(Map<String, dynamic> json) =>
      _$StreamingAppsModelFromJson(json);
}
