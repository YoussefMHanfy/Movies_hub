// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move_hub/content.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../constants.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List upcomingMovies = [];

  List tvShows = [];

  @override
  void initState(){
    loadTrendingMovies();
    super.initState();
  }

  loadTrendingMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(kApiKey, kApiToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getTopRated();
    Map UpcomingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();



    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedMoviesResult['results'];
      tvShows = tvShowsResult['results'];
      upcomingMovies= UpcomingResult['results'];
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBar,
        title: Text('Movies Hub'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming Movies',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),
                SizedBox(height: 10,),
                ContentList(content: upcomingMovies, pathName: 'title',),

                Text(
                  'Trending Movies',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),

                SizedBox(height: 10,),

                ContentList(content: trendingMovies, pathName: 'title',),



                Text(
                  'Top Rated Movies',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),
                SizedBox(height: 10,),
                ContentList(content: topRatedMovies, pathName: 'title',),

                Text(
                  'Popular TV Shows',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),
                SizedBox(height: 10,),
                ContentList(content: tvShows, pathName: 'name',),


              ],
            ),
          ),
        ],
      ),
    );
  }


}