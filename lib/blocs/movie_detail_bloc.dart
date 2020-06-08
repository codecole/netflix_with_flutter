import 'package:codecole/blocs/base.dart';
import 'package:codecole/models/item_models.dart';
import 'package:codecole/models/movie-detail_model.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailModel>{
  Observable <MovieDetailModel> get movieDetail => fetcher.stream;

  fetchMovieDetail(int movieId)async{
    MovieDetailModel itemModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(itemModel);
  }
}

final movieDetailBloc = MovieDetailBloc();