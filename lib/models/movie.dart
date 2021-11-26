import 'dart:convert';

import 'package:flutter/foundation.dart';

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
    required this.id,
    required this.name,
    required this.description,
    required this.posterPath,
    this.genres,
    this.releaseDate,
    this.vote,
    this.videos,
    this.images,
    this.cast,
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

  // Movie updateMovieDetails(Map<String, dynamic> json) {
  //   var genres = json['genres'] as List;
  //   List<String> genreList =
  //       genres.map((item) => item['name'] as String).toList();
  //   Movie movie = Movie(
  //     name: name,
  //     description: description,
  //     posterPath: posterPath,
  //     id: id,
  //     releaseDate: json['release_date'] ?? json['first_air_data'],
  //     vote: json['vote_average'],
  //     genres: genreList,
  //   );

  //   return movie;
  // }

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

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
    List<String>? genres,
    String? releaseDate,
    double? vote,
    List<String>? videos,
    List<String>? images,
    List<Person>? cast,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
      vote: vote ?? this.vote,
      videos: videos ?? this.videos,
      images: images ?? this.images,
      cast: cast ?? this.cast,
    );
  }
}

// genres : []