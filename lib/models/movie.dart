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
}

// genres : []