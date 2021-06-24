import 'package:flutter/material.dart';

class MoviesResponse {
  final int page;
  final List<Movies> result;

  MoviesResponse({this.page, this.result});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
        page: json['page'],
        result:
            List<Movies>.from(json["results"].map((x) => Movies.fromJson(x))));
  }
}

class Movies {
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String overView;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAvg;
  final int voteCount;

  Movies({
    @required this.id,
    @required this.adult,
    @required this.backdropPath,
    @required this.originalLanguage,
    @required this.overView,
    @required this.popularity,
    @required this.posterPath,
    @required this.releaseDate,
    @required this.title,
    @required this.voteAvg,
    @required this.voteCount,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      overView: json['overView'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAvg: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

// class MovieDetails {
//   // final List<Genres> genres;
//   final String homepage;
//   final int id;
//   final String overview;
//   final String popularity;
//   // final List<ProductionCompany> productionCompanies;
//   final String releaseDate;
//   final int runtime;
//   final String status;
//   final String tagline;
//   final String title;
//   final double voteAvg;
//   final double voteCount;
//
//   MovieDetails({
//     // @required this.genres,
//     @required this.homepage,
//     @required this.id,
//     @required this.overview,
//     @required this.popularity,
//     // @required this.productionCompanies,
//     @required this.releaseDate,
//     @required this.runtime,
//     @required this.status,
//     @required this.tagline,
//     @required this.title,
//     @required this.voteAvg,
//     @required this.voteCount,
//   });
//
//   factory MovieDetails.fromJson(Map<String, dynamic> json) {
//     // print(json['production_companies']);
//
//     return MovieDetails(
//       // genres: List<Genres>.from(
//       //     json['genres'].map((genre) => Genres.fromJson(genre))),
//       homepage: json['homepage'],
//       id: json['id'],
//       overview: json['overview'],
//       popularity: json['popularity'],
//       // productionCompanies: List<ProductionCompany>.from(
//       //     json['production_companies']
//       //         .map((company) => ProductionCompany.fromJson(company))),
//       releaseDate: json['release_date'],
//       runtime: json['runtime'],
//       status: json['status'],
//       tagline: json['tagline'],
//       title: json['title'],
//       voteAvg: json['vote_average'],
//       voteCount: json['vote_count'],
//     );
//   }
// }

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
        id: json['id'],
        logoPath: json['logo_path'],
        name: json['name'],
        originCountry: json['origin_country']);
  }
}
