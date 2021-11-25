import 'package:dio/dio.dart';
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

//  Future<List<Movie>> getPopularMovies({required int page}) async {

//  }
}
