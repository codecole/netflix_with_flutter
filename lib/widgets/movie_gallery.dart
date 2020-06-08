import 'package:codecole/blocs/movie_image_bloc.dart';
import 'package:codecole/models/item_models.dart';
import 'package:codecole/models/movie_image_model.dart';
import 'package:flutter/material.dart';
class MovieGallery extends StatefulWidget {
  final int movieId;
  MovieGallery({this.movieId});


  @override
  _MovieGalleryState createState() => _MovieGalleryState();
}

class _MovieGalleryState extends State<MovieGallery> {
  @override
  Widget build(BuildContext context) {
    movieImageBloc.fetchMovieImages(widget.movieId);
    return StreamBuilder(
        stream: movieImageBloc.movieImage,
        builder: (context, AsyncSnapshot<MovieImageModel> snapshot) {
          if (snapshot.hasData) {
            return buildContent(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator()),
          );
        },

    );



  }
  Widget buildContent(AsyncSnapshot<MovieImageModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 3,
      margin: EdgeInsets.only(bottom: 50.0, top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.posters.length > 4
            ? 3
            : snapshot.data.posters.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem (
              snapshot.data.posters[index].file_path,
              width / 3,
              index == 0);

        },
      ),
    );
  }
  _buildItem(
      String imagePath, double itemHeight, bool isFirst) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.only(left: isFirst ? 0 : 10, right: 10, bottom: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all((Radius.circular(10)))),
      child: Image.network('https://image.tmdb.org/t/p/w500$imagePath',
        fit: BoxFit.cover,
        width: itemHeight * 1.35,
        height: itemHeight/2,),
    );
  }
}

