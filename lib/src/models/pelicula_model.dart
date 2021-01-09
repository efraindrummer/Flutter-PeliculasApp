class Peliculas{
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList ){
    
    if(jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }

}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap( Map<String, dynamic> json){
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    genreIds          = json['genre_ids'].cast<int>();
    id                = json['id'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    overview          = json['overview'];
    popularity        = json['popularity'] / 1;
    posterPath        = json['poster_path'];
    releaseDate       = json['release_date'];
    title             = json['title'];
    video             = json['video'];
    voteAverage       = json['vote_average'] / 1;
    voteCount         = json['vote_count'];
  }
}

enum OriginalLanguage { EN, JA, DE, NO }
