import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'movie_model.dart';
import 'movie_repository.dart';

class MovieNotifier extends StateNotifier<List<MovieModel>> {
  MovieNotifier() : super([]) {
    getAllMovies();
  }

  final _repository = MovieRepository(Dio());

  getAllMovies() async {
    state = await _repository.getAllMovies();
  }

}