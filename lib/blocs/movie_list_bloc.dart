import 'package:codecole/models/item_models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:codecole/blocs/base.dart';



class MovieListBloc extends BaseBloc <ItemModel>{
  Observable <ItemModel> get movieList => fetcher.stream;

  fetchMovieList(String type)async{
    ItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);
  }
}


final movieListBloc = MovieListBloc();