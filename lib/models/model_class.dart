class Movie {
  final String title;
  final String releaseDate;
  final String overview;
  final String posterUrl;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'Unknown Title',
      releaseDate: json['release_date'] ?? 'Unknown Release Date',
      overview: json['overview'] ?? 'No Overview available',
      posterUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}' ?? '',
    );
  }
}
