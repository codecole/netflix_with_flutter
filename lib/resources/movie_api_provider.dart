import 'dart:async';
import 'dart:convert';

import 'package:codecole/models/item_models.dart';
import 'package:codecole/models/movie-detail_model.dart';
import 'package:codecole/models/movie_image_model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/testing.dart';


class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'fa976511f9e61c1c255110f89f1226e8';

  Future<ItemModel> fetchMovieList (String type) async {
    final response = await client.get('https://api.themoviedb.org/3/movie/$type?api_key=$_apiKey');

    print (response.request.url);
    print(response.body.toString());

    if(response.statusCode==200){
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load content');
    }

  }
  Future<MovieImageModel> fetchMovieImages (int movieId) async {
    final response = await client.get('https://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey');

    print (response.request.url);
    print(response.body.toString());

    if(response.statusCode==200){
      return MovieImageModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load content');
    }

  }

  Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
    final response = await client.get('https://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey');

    print (response.request.url);
    print(response.body.toString());

    if(response.statusCode==200){
      return MovieDetailModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load content');
    }

  }
}