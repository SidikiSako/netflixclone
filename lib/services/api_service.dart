import 'package:dio/dio.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/person.dart';
import 'package:netflix_clone/models/video.dart';
import 'package:netflix_clone/services/api.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    // on construit l'url
    String _url = api.baseURL + path;

    // pour chaque appelle, on doit fournir en paramètre le apiKey et la langue
    Map<String, dynamic> _params = {
      'api_key': api.apiKey,
      'language': 'fr-FR',
    };

    //si params n'est pas null, alors on les ajoutes à _params
    // par exemple on pourrait fournir l'id d'un movie en plus
    if (params != null) {
      _params.addAll(params);
    }

    // on fait l'appelle API
    final response = await dio.get(_url, queryParameters: _params);
    // on check si la réquête s'est bien passée
    if (response.statusCode == 200) {
      return response;
    }
    // on traite les erreurs dans le repository et dans l'UI
    // avec le throw response, le code qui appellera cette fonction sera
    // capable de traiter ça dans un try catch bloc
    throw response;
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response response = await getData(
      '/movie/popular',
      params: {
        'page': page,
      },
    );
    return reformatJsonList(response);
  }

  Future<List<Movie>> getPopularTVShows({required int page}) async {
    Response response = await getData(
      '/tv/popular',
      params: {
        'page': page,
      },
    );
    return reformatJsonList(response);
  }

  Future<List<Movie>> getNowPlaying({required int page}) async {
    Response response = await getData(
      '/movie/now_playing',
      params: {
        'page': page,
      },
    );
    return reformatJsonList(response);
  }

  Future<Movie> getMovieDetails({required Movie movie}) async {
    Response response = await getData('/movie/${movie.id}');
    if (response.statusCode == 200) {
      Map<String, dynamic> _data = response.data;
      var genres = _data['genres'] as List;
      List<String> genreList =
          genres.map((item) => item['name'] as String).toList();
      // Movie newMovie = movie.updateMovieDetails(_data);
      Movie newMovie = movie.copyWith(
        vote: _data['vote_average'],
        releaseDate: _data['release_date'],
        genres: genreList,
      );

      return newMovie;
    } else {
      throw response;
    }
  }

  Future<Movie> getMovieCast({required Movie movie}) async {
    Response response = await getData('/movie/${movie.id}/credits');
    if (response.statusCode == 200) {
      Map _data = response.data;

      List<Person> casting = _data['cast'].map<Person>((personJson) {
        return Person.fromJson(personJson);
      }).toList();

      return movie.copyWith(cast: casting);
    } else {
      throw response;
    }
  }

  Future<Movie> getMovieImages({required Movie movie}) async {
    Response response = await getData(
      '/movie/${movie.id}/images',
      params: {
        'include_image_language': 'null',
      },
    );
    if (response.statusCode == 200) {
      //Map _data = response.data;

      Map<String, dynamic> _data = response.data;
      //print('data = $_data');
      var images = _data['backdrops'] as List;
      //print('images = $images');
      List<String> urls =
          images.map((item) => api.baseImageURL + item['file_path']).toList();
      //print('IMAGE URLS = $urls');
      return movie.copyWith(
        images: urls,
      );
    } else {
      throw response;
    }
  }

  Future<Movie> getMovieVideos({required Movie movie}) async {
    Response response = await getData('/movie/${movie.id}/videos');
    if (response.statusCode == 200) {
      Map _data = response.data;

      List<Video> videos = _data['results'].map<Video>((videoJson) {
        return Video.fromJson(videoJson);
      }).toList();

      return movie.copyWith(videos: videos);
    } else {
      throw response;
    }
  }

  // Future<Movie> getTVShowDetails({required Movie movie}) async {
  //   Response response = await getData('/tv/${movie.id}');
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> _data = response.data;
  //     Movie newMovie = movie.updateMovieDetails(_data);
  //     return newMovie;
  //   } else {
  //     throw response;
  //   }
  // }
}

List<Movie> reformatJsonList(Response response) {
  if (response.statusCode == 200) {
    Map _data = response.data;

    List<Movie> movies = _data['results'].map<Movie>((movideJson) {
      return Movie.fromJson(movideJson);
    }).toList();

    return movies;
  } else {
    throw response;
  }
}
