import 'package:netflix_clone/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;

  Movie(
      {required this.name,
      required this.description,
      required this.posterPath,
      required this.id});

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
