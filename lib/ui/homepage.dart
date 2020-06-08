import 'package:codecole/constants/globals.dart';
import 'package:codecole/widgets/category.dart';
import 'package:codecole/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:codecole/utilities/scroll_behaviour.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movieflix'),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: Container(
        child: ScrollConfiguration(
          behavior: MyScrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MovieCategory(),
                Padding(
                padding: EdgeInsets.only(top: 10)),
                  _buildMyList(context),
                Padding(
                  padding: EdgeInsets.only(top: 10)),
                _buildPopularList(context),
              ],
            )
          ),
        )

      ,
        color: Colors.white,

      ),
    );
  }
  _buildMyList (BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:20, right:20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text('My List', style: TextStyle(
                  color:Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),)
              ),
              Icon(Icons.arrow_forward, color: Colors.black)
            ],
          ),
        ),
          MovieListView(type: MovieListType.topRated,onItemInteraction: null,)
        ],
      ),
    );
  }
  _buildPopularList(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:20, right:20),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text('Popular on MovieFlix', style: TextStyle(
                      color:Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),)
                ),
                Icon(Icons.arrow_forward, color: Colors.black)
              ],
            ),
          ),
          MovieListView(type:MovieListType.topRated, onItemInteraction: null,)
        ],
      ),
    );

  }
}
