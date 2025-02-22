import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movix/constants/api_constants.dart';
import 'package:movix/models/movie_genre.dart';
import 'package:movix/models/movie_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final url =
        Uri.parse("${ApiConstants.baseUrl}movie/popular?language=en-US&page=1");
    final response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(
          data['results'].map((element) => MovieModel.fromJson(element)));
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }

  Future<List<MoviesGenre>> fetchMovieGenres() async {
    final url =
        Uri.parse("${ApiConstants.baseUrl}genre/movie/list?language=en");
    final response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(
          data['genres'].map((element) => MoviesGenre.fromJson(element)));
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}
