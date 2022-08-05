import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_api_movies/movie_repository.dart';

import 'movie_model.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MovieRepository repository = MovieRepository(Dio());
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    movies = repository.getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: const Text(
          'Studio Ghibli',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: movies,
          builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  MovieModel movie = snapshot.data![index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    title: Text('${movie.title} (${movie.releaseDate})'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.originalTitleRomanised),
                        Text(movie.originalTitle),
                      ],
                    ),
                    trailing: CircleAvatar(
                      radius: 25,
                      child: Text(movie.rtScore),
                    ),
                    leading: Image.network(movie.image),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.purple.shade100,
                        width: 0.8,
                      ),
                    ),
                    onTap: () {
                      var alert = AlertDialog(
                        scrollable: true,
                        title: Text(
                          movie.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Column(
                          children: [
                            Image.network(movie.image),
                            const SizedBox(height: 15),
                            Text(
                              movie.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  'Diretor: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  movie.director,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Produtor: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  movie.producer,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Tempo de duração: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  movie.runningTime,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => alert,
                      );
                    },
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
