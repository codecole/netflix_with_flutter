import 'package:codecole/blocs/movie_list_bloc.dart';
import 'package:codecole/models/item_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatefulWidget {
  MovieListView({this.type, this.onItemInteraction});
  final String type;
  final Function(int movieId) onItemInteraction;

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(widget.type);
    return StreamBuilder(
        stream: movieListBloc.movieList,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildContent(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }

  Widget buildContent(AsyncSnapshot<ItemModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 1.75,
      margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.results.length > 10
            ? 10
            : snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (widget.onItemInteraction != null) {
                widget.onItemInteraction(snapshot.data.results[index].id);
              } else {
                debugPrint('No handle');
              }
            },
            child: _buildItem(
                snapshot.data.results[index].poster_path,
                snapshot.data.results[index].backdrop_path,
                width / 4,
                index == 0),
          );
        },
      ),
    );
  }

  _buildItem(
      String imagePath, String backdropPath, double itemHeight, bool isFirst) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all((Radius.circular(10)))),
      child: Image.network('https://image.tmdb.org/t/p/w500$imagePath',
      fit: BoxFit.cover,
      width: itemHeight * 1.35,
      height: itemHeight/2,),
    );
  }
}
