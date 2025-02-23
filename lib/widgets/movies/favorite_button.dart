import 'package:flutter/material.dart';
import 'package:movix/constants/app_icons.dart';
import 'package:movix/models/movie_model.dart';
import 'package:movix/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, FavoriteProvider favoriteProvider, child) {
      return IconButton(
        onPressed: () => favoriteProvider.addOrRemoveFavorites(movieModel),
        icon: Icon(
          favoriteProvider.isFavorite(movieModel)
              ? AppIcons.favoriteRounded
              : AppIcons.favoriteOulinedRounded,
          color: favoriteProvider.isFavorite(movieModel) ? Colors.red : null,
          size: 20,
        ),
      );
    });
  }
}
