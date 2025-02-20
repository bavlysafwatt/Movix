import 'package:movix/models/movie_genre.dart';
import 'package:movix/repos/movies_repo.dart';
import 'package:movix/services/init_getit.dart';

class GenreMapper {
  static List<String> movieGenresNames(List<int> ids) {
    final moviesRepo = getIt.get<MoviesRepo>();
    List<String> genresName = [];
    final cachedGenres = moviesRepo.cachedGenres;
    for (var genreId in ids) {
      MoviesGenre genre = cachedGenres.firstWhere(
        (element) => element.id == genreId,
        orElse: () => MoviesGenre(
          id: 57634,
          name: "Unknow",
        ),
      );
      genresName.add(genre.name);
    }
    return genresName;
  }
}
