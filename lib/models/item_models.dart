import 'package:codecole/models/base_models.dart';


class ItemModel extends BaseModel{
  int _page;
  int _totalResults;
  int _totalPages;

  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson){
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];

    List <_Result> temp =[];
    for(int i = 0; i < parsedJson['results'].length; i++){
      _Result result = _Result(parsedJson[results][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List <_Result> get results => _results;
  int get total_pages => _totalPages;
  int get total_results => _totalResults;
  int get page => _page;
}


class _Result{
  int _voteCount;
  int _id;
  bool _video;

  var _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;

  List <int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  _Result(result){
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video= result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result ['poster_path'];
    _originalLanguage = result ['original_language'];
    _originalTitle = result['original_title'];

    for (int i = 0; i < result['genreIds'][i]; i++){
_genreIds.add(result['genre_id'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];

    _overview = result ['overview'];
    _releaseDate = result['release_date'];

  }
  String get release_date => _releaseDate;
  String get overview => _overview;
  bool get adult => _adult;
  String get backdrop_path => _backdropPath;
  List<int> get genre_ids =>_genreIds;
  String get original_title => _originalTitle;
  String get original_language => _originalLanguage;
  String get poster_path => _posterPath;
  double get popularity => _popularity;
  String get title => _title;
  double get vote_average =>_voteAverage;
  bool get video => _video;
  int get id => _id;
  int get vote_count => _voteCount;

}