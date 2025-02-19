import 'package:flutter/material.dart';
import 'package:movix/constants/app_icons.dart';
import 'package:movix/widgets/movies/movies_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: Icon(
              AppIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => MoviesWidget(),
      ),
    );
  }
}
