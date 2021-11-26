import 'package:netflix_clone/models/person.dart';
import 'package:netflix_clone/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  final List<String>? genres;
  final String? releaseDate;
  final double? vote;
  final List<String>? videos;
  final List<String>? images;
  final List<Person>? cast;

  Movie({
    required this.name,
    required this.description,
    required this.posterPath,
    required this.id,
    this.cast,
    this.genres,
    this.images,
    this.releaseDate,
    this.videos,
    this.vote,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['title'] ?? json['name'],
      description: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  String posterURL() {
    API api = API();
    return api.baseImageURL + posterPath!;
  }

  Movie updateMovieDetails(Map<String, dynamic> json) {
    var genres = json['genres'] as List;
    List<String> genreList =
        genres.map((item) => item['name'] as String).toList();
    Movie movie = Movie(
      name: name,
      description: description,
      posterPath: posterPath,
      id: id,
      releaseDate: json['release_date'] ?? json['first_air_data'],
      vote: json['vote_average'],
      genres: genreList,
    );

    return movie;
  }

  String reformatGenres() {
    String _genres = '';
    if (genres != null) {
      for (int i = 0; i < genres!.length; i++) {
        if (i == genres!.length - 1) {
          _genres = _genres + genres![i];
        } else {
          _genres = _genres + '${genres![i]}, ';
        }
      }
    }
    return _genres;
  }
}

// genres : []