import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api_service.dart';

class DataProvider with ChangeNotifier {
  final APIService apiService = APIService();
  final List<Movie> _popularMovies = [];
  int _popularMoviePageIndex = 1;

  // getters

  List<Movie> get popularMovies => _popularMovies;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies =
          await apiService.getPopularMovies(page: _popularMoviePageIndex);
      // on ajoute les movies récupérer à la liste des movies populaires
      _popularMovies.addAll(movies);
      // on incremente la page pour la prochaine fois
      _popularMoviePageIndex++;
      // on notifie ceux qiu utilisent _popularMovies que les données ont changé
      notifyListeners();
    } on Response catch (response) {
      print("Error : ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> initData() async {
    await getPopularMovies();
  }
}
