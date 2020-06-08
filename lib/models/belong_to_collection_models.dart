class BelongToCollectionModel {

  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongToCollectionModel.fromJson(Map<String, dynamic> parsedJson){
    if (parsedJson == null){
      return;
    }
    id = parsedJson['id']??0;
    name = parsedJson['name']??"";
    posterPath = parsedJson['poster_path']??"";
    backdropPath = parsedJson['backdrop_path']??"";
  }
}
