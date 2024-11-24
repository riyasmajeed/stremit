class Movie {
  final String? backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Factory method to create a Movie instance from JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      // Use `title` for movies, `name` for TV shows
      title: json['title'] ?? json['name'] ?? 'Unknown Title',
      // Use `original_title` for movies, `original_name` for TV shows
      originalTitle: json['original_title'] ?? json['original_name'] ?? 'Unknown Original Title',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      // Media type can be "movie" or "tv" depending on the API response
      mediaType: json['media_type'] ?? 'unknown',
      adult: json['adult'] ?? false,
      originalLanguage: json['original_language'] ?? 'en',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? json['first_air_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
