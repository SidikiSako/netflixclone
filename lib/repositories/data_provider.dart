import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api_service.dart';

class DataProvider with ChangeNotifier {
  final APIService apiService = APIService();
  final List<Movie> _popularMovies = [];
  int _popularMoviePageIndex = 1;
  final List<Movie> _popularTVShows = [];
  int _popularTVShowsPageIndex = 1;
  final List<Movie> _nowPlaying = [];
  int _nowPlayingPageIndex = 1;

  // getters

  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get popularTVShows => _popularTVShows;
  List<Movie> get nowPlaying => _nowPlaying;

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

  Future<void> getPopularTVShows() async {
    try {
      List<Movie> movies =
          await apiService.getPopularTVShows(page: _popularTVShowsPageIndex);
      // on ajoute les movies récupérer à la liste des movies populaires
      _popularTVShows.addAll(movies);
      // on incremente la page pour la prochaine fois
      _popularTVShowsPageIndex++;
      // on notifie ceux qiu utilisent _popularMovies que les données ont changé
      notifyListeners();
    } on Response catch (response) {
      print("Error : ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getNowPlaying() async {
    try {
      List<Movie> movies =
          await apiService.getNowPlaying(page: _nowPlayingPageIndex);
      // on ajoute les movies récupérer à la liste des movies populaires
      _nowPlaying.addAll(movies);
      // on incremente la page pour la prochaine fois
      _nowPlayingPageIndex++;
      // on notifie ceux qiu utilisent _popularMovies que les données ont changé
      notifyListeners();
    } on Response catch (response) {
      print("Error : ${response.statusCode}");
      rethrow;
    }
  }

  Future<Movie> getMovieDetails({required Movie movie}) async {
    try {
      //on recupère les details
      Movie newMovie = await apiService.getMovieDetails(movie: movie);
      // on recupère les acteurs
      newMovie = await apiService.getMovieCast(movie: newMovie);
      // on recupère les videos
      newMovie = await apiService.getMovieVideos(movie: newMovie);
      // on recupère les photos
      newMovie = await apiService.getMovieImages(movie: newMovie);
      return newMovie;
    } on Response catch (response) {
      print("Error : ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> initData() async {
    // await getPopularMovies();
    // await getPopularTVShows();
    // await getNowPlaying();
    await Future.wait([
      getPopularMovies(),
      getPopularTVShows(),
      getNowPlaying(),
    ]);
  }
}
