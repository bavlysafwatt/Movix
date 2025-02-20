import 'package:flutter/material.dart';
import 'package:movix/models/movie_model.dart';
import 'package:movix/util/genre_mapper.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    List<String> genres = GenreMapper.movieGenresNames(movieModel.genreIds);

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
              fontSize: 15,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
