class MovieDetailsEntity {
  final String title;
  final String imageUrl;
  final String overview;
  final int year;
  final double rating;
  final List<StreamingAppsEntity> streamingApps;

  MovieDetailsEntity({
    required this.title,
    required this.imageUrl,
    required this.overview,
    required this.year,
    required this.rating,
    required this.streamingApps,
  });
}

class StreamingAppsEntity {
  final String name;
  final String url;

  StreamingAppsEntity({
    required this.name,
    required this.url,
  });
}
