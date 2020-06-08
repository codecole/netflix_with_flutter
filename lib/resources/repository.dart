import 'dart:async';

import 'package:codecole/models/item_models.dart';
import 'package:codecole/models/movie-detail_model.dart';
import 'package:codecole/models/movie_image_model.dart';
import 'package:http/http.dart' show Client;
import 'package:codecole/resources/movie_api_provider.dart';


class  Repository {
  final moviesApiProvider = MovieApiProvider();

  Future <MovieDetailModel> fetchMovieDetail(int movieId)=>
      moviesApiProvider.fetchMovieDetail(movieId);

  Future <MovieImageModel> fetchMovieImages(int movieId)=>
      moviesApiProvider.fetchMovieImages(movieId);

  Future <ItemModel> fetchMovieList(String type)=>
      moviesApiProvider.fetchMovieList(type);

}