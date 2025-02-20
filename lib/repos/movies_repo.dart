import 'package:movix/models/movie_genre.dart';
import 'package:movix/models/movie_model.dart';
import 'package:movix/services/api_service.dart';

class MoviesRepo {
  final ApiService apiService;

  MoviesRepo({required this.apiService});

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await apiService.fetchMovies(page: page);
  }

  Future<List<MoviesGenre>> fetchMovieGenres() async {
    return apiService.fetchMovieGenres();
  }
}
