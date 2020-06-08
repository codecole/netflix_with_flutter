import 'package:codecole/blocs/base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:codecole/models/movie_image_model.dart';

class MovieImageBloc extends BaseBloc<MovieImageModel>{
  Observable <MovieImageModel> get movieImage => fetcher.stream;

  fetchMovieImages(int movieId)async{
    MovieImageModel itemModel = await repository.fetchMovieImages(movieId);
    fetcher.sink.add(itemModel);
  }
}

final movieImageBloc = MovieImageBloc();