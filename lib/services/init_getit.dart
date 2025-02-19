import 'package:get_it/get_it.dart';
import 'package:movix/repos/movies_repo.dart';
import 'package:movix/services/api_service.dart';
import 'package:movix/services/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(),
  );

  getIt.registerLazySingleton<MoviesRepo>(
    () => MoviesRepo(apiService: getIt.get<ApiService>()),
  );
}
