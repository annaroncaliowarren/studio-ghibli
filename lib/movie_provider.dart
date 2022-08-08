import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'movie_model.dart';
import 'movie_notifier.dart';

final movieProvider = StateNotifierProvider<MovieNotifier, List<MovieModel>>(
  (ref) => MovieNotifier(),
);


