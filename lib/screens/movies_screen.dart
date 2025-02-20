import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movix/constants/app_icons.dart';
import 'package:movix/models/movie_model.dart';
import 'package:movix/repos/movies_repo.dart';
import 'package:movix/screens/favorites_screen.dart';
import 'package:movix/services/init_getit.dart';
import 'package:movix/services/navigation_service.dart';
import 'package:movix/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() {
      _isFetching = true;
    });
    try {
      final List<MovieModel> movies =
          await getIt.get<MoviesRepo>().fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (error) {
      getIt
          .get<NavigationService>()
          .showSnackbar("An Error has been occured $error");
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(FavoritesScreen());
            },
            icon: Icon(
              AppIcons.favorite,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(AppIcons.darkMode),
          ),
        ],
      ),
      body: _movies.isEmpty && _isFetching
          ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.grey, size: 30))
          : ListView.builder(
              controller: _scrollController,
              itemCount: _movies.length + (_isFetching ? 1 : 0),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index < _movies.length) {
                  return MoviesWidget(
                    movieModel: _movies[index],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.grey, size: 30)),
                  );
                }
              },
            ),
    );
  }
}
