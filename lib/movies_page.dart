import 'package:flutter/material.dart';
import 'package:get_api_movies/movie_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class MoviesPage extends StatefulHookConsumerWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  // MovieRepository repository = MovieRepository(Dio());
  // late Future<List<MovieModel>> movies;

  // @override
  // void initState() {
  //   movies = repository.getAllMovies();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieProvider);

    return Scaffold(
      appBar: AppBar(
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
        child: Visibility(
          visible: movies.isNotEmpty,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                title: Text('${movies[index].title} (${movies[index].releaseDate})'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movies[index].originalTitleRomanised),
                    Text(movies[index].originalTitle),
                  ],
                ),
                trailing: CircleAvatar(
                  radius: 25,
                  child: Text(
                    movies[index].rtScore,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                leading: Image.network(movies[index].image),
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
                      movies[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Column(
                      children: [
                        Image.network(movies[index].image),
                        const SizedBox(height: 15),
                        Text(
                          movies[index].description,
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
                            Expanded(
                              child: Text(
                                movies[index].director,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Produtor: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                movies[index].producer,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
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
                              movies[index].runningTime,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Image.network(movies[index].movieBanner),
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
          ),
        ),
        // child: FutureBuilder(
        //   future: movies,
        //   builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //         itemCount: snapshot.data!.length,
        //         itemBuilder: (context, index) {
        //           MovieModel movie = snapshot.data![index];
        //           return ListTile(
        //             contentPadding: const EdgeInsets.symmetric(
        //               horizontal: 20,
        //               vertical: 15,
        //             ),
        //             title: Text('${movie.title} (${movie.releaseDate})'),
        //             subtitle: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(movie.originalTitleRomanised),
        //                 Text(movie.originalTitle),
        //               ],
        //             ),
        //             trailing: CircleAvatar(
        //               radius: 25,
        //               child: Text(
        //                 movie.rtScore,
        //                 style: const TextStyle(
        //                   fontSize: 17,
        //                 ),
        //               ),
        //             ),
        //             leading: Image.network(movie.image),
        //             shape: RoundedRectangleBorder(
        //               side: BorderSide(
        //                 color: Colors.purple.shade100,
        //                 width: 0.8,
        //               ),
        //             ),
        //             onTap: () {
        //               var alert = AlertDialog(
        //                 scrollable: true,
        //                 title: Text(
        //                   movie.title,
        //                   style: const TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 content: Column(
        //                   children: [
        //                     Image.network(movie.image),
        //                     const SizedBox(height: 15),
        //                     Text(
        //                       movie.description,
        //                       textAlign: TextAlign.center,
        //                       style: const TextStyle(
        //                         fontSize: 17,
        //                       ),
        //                     ),
        //                     const SizedBox(height: 15),
        //                     Row(
        //                       children: [
        //                         const Text(
        //                           'Diretor: ',
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                         Expanded(
        //                           child: Text(
        //                             movie.director,
        //                             style: const TextStyle(
        //                               fontSize: 16,
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(height: 2),
        //                     Row(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         const Text(
        //                           'Produtor: ',
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                         Expanded(
        //                           child: Text(
        //                             movie.producer,
        //                             style: const TextStyle(
        //                               fontSize: 16,
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(height: 2),
        //                     Row(
        //                       children: [
        //                         const Text(
        //                           'Tempo de duração: ',
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                         Text(
        //                           movie.runningTime,
        //                           style: const TextStyle(
        //                             fontSize: 16,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(height: 15),
        //                     Image.network(movie.movieBanner),
        //                   ],
        //                 ),
        //               );
        //               showDialog(
        //                 context: context,
        //                 builder: (BuildContext context) => alert,
        //               );
        //             },
        //           );
        //         },
        //       );
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ),
      ),
    );
  }
}
