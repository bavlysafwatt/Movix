import 'package:flutter/material.dart';
import 'package:movix/constants/app_icons.dart';
import 'package:movix/providers/favorite_provider.dart';
import 'package:movix/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteProvider favoriteProvider =
        Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movies"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () => favoriteProvider.clearAllFavorites(),
            icon: Icon(
              AppIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Consumer(
          builder: (context, FavoriteProvider favoriteProvider, child) {
        return ListView.builder(
          itemCount: favoriteProvider.favoritesList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              MoviesWidget(movieModel: favoriteProvider.favoritesList[index]),
        );
      }),
    );
  }
}
