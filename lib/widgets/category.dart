import 'package:codecole/blocs/movie_list_bloc.dart';
import 'package:codecole/models/item_models.dart';
import 'package:flutter/material.dart';
import 'package:codecole/constants/globals.dart';


class MovieCategory extends StatefulWidget {
  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(MovieListType.upcoming);
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
            child: Center(child: LinearProgressIndicator()),
          );
        }
        );
  }
  Widget buildContent(AsyncSnapshot<ItemModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 4,
      margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.results.length > 4
            ? 3
            : snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(
                snapshot.data.results[index].poster_path,
                snapshot.data.results[index].backdrop_path,
                width / 3,
                index == 0);

        },
      ),
    );
  }

  _buildItem(
      String imagePath, String category, double itemHeight, bool isFirst) {
    return Container(
      width: itemHeight,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all((Radius.circular(10)))),
        child:  LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Stack(
              children: <Widget>[
                Image.network('https://image.tmdb.org/t/p/w500$imagePath',
                  fit: BoxFit.cover,
                  width: constraints.biggest.width,
                  height: constraints.biggest.height,),
                Container(
                  alignment: Alignment.center,
                  width: constraints.biggest.width,
                  height: constraints.biggest.height,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(category,
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )),
                  ),

                )
              ],

            );
          },
        )
      ),
    );
  }
}
