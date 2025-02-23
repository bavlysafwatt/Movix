import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movix/models/movie_genre.dart';
import 'package:movix/models/movie_model.dart';
import 'package:movix/repos/movies_repo.dart';
import 'package:movix/services/init_getit.dart';

class MoviesProvider with ChangeNotifier {
  int _currentPage = 1;

  final List<MovieModel> _movies = [];
  List<MovieModel> get moviesList => _movies;

  List<MoviesGenre> _genresList = [];
  List<MoviesGenre> get genresList => _genresList;

  bool _isFetching = false;
  bool get isLoading => _isFetching;

  String _fetchMoviesError = '';
  String get fetchMoviesError => _fetchMoviesError;

  final MoviesRepo moviesRepo = getIt.get<MoviesRepo>();

  Future<void> getMovies() async {
    _isFetching = true;
    notifyListeners();

    try {
      if (_genresList.isEmpty) {
        _genresList = await moviesRepo.fetchMovieGenres();
      }
      List<MovieModel> moviesList =
          await moviesRepo.fetchMovies(page: _currentPage);
      _movies.addAll(moviesList);
      _currentPage++;
      _fetchMoviesError = "";
    } catch (e) {
      log("An error occured while fetching movies $e");
      _fetchMoviesError = e.toString();
      rethrow;
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
