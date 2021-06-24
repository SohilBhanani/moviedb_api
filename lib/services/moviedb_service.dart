import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sohilbhanani_moviedb/config.dart';
import 'package:sohilbhanani_moviedb/models/new_model.dart';
import 'package:sohilbhanani_moviedb/models/movie_model.dart';
import 'package:sohilbhanani_moviedb/models/video_model.dart';

const String apiKey = API_KEY;
const String url = "api.themoviedb.org";
const String topRatedPath = "/3/movie/top_rated";
const String movieDetailPath = "/3/movie/";

Future fetchMovies() async {
  final response =
      await http.get(Uri.https(url, topRatedPath, {"api_key": apiKey}));
  if (response.statusCode == 200) {
    // print(response.body.["results"]);
    return MoviesResponse.fromJson(jsonDecode(response.body));

    // return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

Future<MovieDetails> fetchMovieDetails(int id) async {
  final response = await http.get(
      Uri.https(url, movieDetailPath + id.toString(), {"api_key": apiKey}));
  // print(response.body);
  if (response.statusCode == 200) {
    // return response.body;
    return MovieDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

Future<Videos> fetchVideos(int id) async {
  final response = await http.get(
      Uri.https(url, movieDetailPath + id.toString()+"/videos", {"api_key": apiKey}));
  if (response.statusCode == 200) {
    // return response.body;
    return Videos.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }

  }
