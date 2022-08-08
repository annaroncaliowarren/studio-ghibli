import 'dart:convert';

class MovieModel {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String image;
  final String movieBanner;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String runningTime;
  final String rtScore;

  MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      originalTitleRomanised: map['original_title_romanised'] ?? '',
      image: map['image'] ?? '',
      movieBanner: map['movie_banner'] ?? '',
      description: map['description'] ?? '',
      director: map['director'] ?? '',
      producer: map['producer'] ?? '',
      releaseDate: map['release_date'] ?? '',
      runningTime: map['running_time'] ?? '',
      rtScore: map['rt_score'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'originalTitle': originalTitle});
    result.addAll({'originalTitleRomanised': originalTitleRomanised});
    result.addAll({'image': image});
    result.addAll({'movieBanner': movieBanner});
    result.addAll({'description': description});
    result.addAll({'director': director});
    result.addAll({'producer': producer});
    result.addAll({'releaseDate': releaseDate});
    result.addAll({'runningTime': runningTime});
    result.addAll({'rtScore': rtScore});
  
    return result;
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));
}
