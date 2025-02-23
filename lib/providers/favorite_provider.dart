import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movix/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider with ChangeNotifier {
  final List<MovieModel> _favoritesList = [];
  final String key = "favorite";

  List<MovieModel> get favoritesList => _favoritesList;

  bool isFavorite(MovieModel movieModel) {
    return _favoritesList.any((element) => element.id == movieModel.id);
  }

  void addOrRemoveFavorites(MovieModel movieModel) {
    if (isFavorite(movieModel)) {
      _favoritesList.removeWhere((element) => element.id == movieModel.id);
    } else {
      _favoritesList.add(movieModel);
    }
    saveFavorites();
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList =
        _favoritesList.map((movie) => json.encode(movie.toJson())).toList();
    prefs.setStringList(key, stringList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(key) ?? [];
    _favoritesList.clear();
    _favoritesList
        .addAll(stringList.map((e) => MovieModel.fromJson(json.decode(e))));
    notifyListeners();
  }

  void clearAllFavorites() {
    _favoritesList.clear();
    saveFavorites();
    notifyListeners();
  }
}
