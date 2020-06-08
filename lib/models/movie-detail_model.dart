import 'package:codecole/models/base_models.dart';
import 'package:codecole/models/belong_to_collection_models.dart';
import 'package:codecole/models/production_company_model.dart';
import 'package:codecole/models/production_country_model.dart';
import 'package:codecole/models/spoken_language.dart';
import 'package:codecole/models/genre_model.dart';


class MovieDetailModel extends BaseModel{
  bool adult;
  String backdropPath;
  BelongToCollectionModel belong_to_collection;//todo; revisit
  int budget;
  List <GenreModel> genres = [];
  String homepage;
  int id;
  String imdb_id;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;

  List <ProductionCompanyModel> production_companies = [];
  List <ProductionCountryModel> production_countries = [];
  int revenue;
  int runtime;

  List <SpokenLanguage> spoken_language = [];
  String status;
  String tagline;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  MovieDetailModel.fromJson(Map<String, dynamic> parsedJson){
adult  =parsedJson['adult'];
backdropPath  =parsedJson['backdrop_path'];

belong_to_collection = BelongToCollectionModel.fromJson(parsedJson['belong_to_collection']);
budget = parsedJson['budget'];
genres = GenreModel.fromJsonArray(parsedJson['genres']);
homepage  =parsedJson['homepage'];
id  =parsedJson['id'];
imdb_id=parsedJson['imdb_id'];
original_title  =parsedJson['original_title'];
original_language =parsedJson['original_language'];
overview   =parsedJson['overview'];
popularity  =parsedJson['poplarity'];
posterPath = parsedJson['poster_path'];
production_companies = ProductionCompanyModel.fromJsonArray(parsedJson['production_companies']);
production_countries=ProductionCountryModel.fromJsonArray(parsedJson['production_countries']);
revenue = parsedJson['revenue'];
runtime = parsedJson['runtime'];
spoken_language = SpokenLanguage.fromJsonArray(parsedJson['spoken_language']);
status = parsedJson['status'];
tagline = parsedJson['tagline'];
video  = parsedJson['video'];
vote_count  =parsedJson['vote_count'];
vote_average  =parsedJson['vote_average'];



  }


  
  
}