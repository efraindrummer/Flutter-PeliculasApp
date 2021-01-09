import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apiKey   = '1c3e08a883cf9f796c3fdb629a240b97';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;

  //stream -  corriente de datos
  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeString(){
    _popularesStreamController?.close();
  }


  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async{

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'   : _apiKey,
      'language'  : _language
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async{

    _popularesPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'      : _popularesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;
  }
}