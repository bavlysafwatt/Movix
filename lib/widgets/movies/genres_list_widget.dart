import 'package:flutter/material.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> genres = ["Horror", "Action", "Thriller", "Drama"];

    return Wrap(
      children: List.generate(
        genres.length,
        (index) => chipWidget(name: genres[index], context: context),
      ),
    );
  }

  Widget chipWidget({required String name, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Theme.of(context).colorScheme.surface),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
