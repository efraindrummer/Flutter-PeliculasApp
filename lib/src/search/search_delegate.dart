import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Soul',
    'Ironman',
    'Capitan America',
    'The Doorman',
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Soul',
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
      //las acciones del appbar
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = '';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // icono a la zquierda del appBar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // es el builder o la instrccion que crea lo resultados que vamos a mostrar
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.redAccent,
          child: Text(seleccion),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // son las sugerencias cuando la persona escribe

    //retornar la lista de peliculas que una persona escribe en query
    final listaSugerida = (query.isEmpty) ? peliculasRecientes : peliculas.where(
      (p) => p.toLowerCase().startsWith(query.toLowerCase())
    ).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion = listaSugerida[i];
            //se nesecita el metodo para construir los resultados
            showResults(context);
          },
        );
      },
    );
  }



}