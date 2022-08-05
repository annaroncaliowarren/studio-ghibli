import 'package:dio/dio.dart';

import 'movie_model.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository(this.dio);

  Future<List<MovieModel>> getAllMovies() async {
    final response = await dio.get('https://ghibliapi.herokuapp.com/films');
    List<MovieModel> listMovies = [];

    listMovies = List.from(
      response.data.map(
        (movie) {
          return MovieModel.fromMap(movie);
        },
      ),
    );

    return listMovies;
  }
}
