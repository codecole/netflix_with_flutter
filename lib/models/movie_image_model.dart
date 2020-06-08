import 'package:codecole/models/base_models.dart';
import 'package:codecole/models/belong_to_collection_models.dart';
import 'package:codecole/models/production_company_model.dart';
import 'package:codecole/models/production_country_model.dart';
import 'package:codecole/models/spoken_language.dart';
import 'package:codecole/models/genre_model.dart';
import 'package:codecole/models/image_model.dart';
import 'package:flutter/cupertino.dart';

class MovieImageModel  extends BaseModel{
  int id;
  List<ImageModel> posters = [];
  List<ImageModel> backdrops = [];
  MovieImageModel.fromJson(Map<String, dynamic> parsedJson){

    id = parsedJson['id'];
    posters = ImageModel.fromJsonArray(parsedJson['posters']);
    backdrops = ImageModel.fromJsonArray(parsedJson['backdrops']);
  }
}