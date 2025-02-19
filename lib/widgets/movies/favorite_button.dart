import 'package:flutter/material.dart';
import 'package:movix/constants/app_icons.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // TODO: implement add to favorites
      },
      icon: Icon(
        AppIcons.favoriteOulinedRounded,
        size: 20,
      ),
    );
  }
}
