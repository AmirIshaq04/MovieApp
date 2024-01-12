import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:video_player/models/model_class.dart';
import 'package:video_player/widgets/movie.dart';
import 'package:video_player/widgets/toprated.dart';
import 'package:video_player/widgets/tv.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // List<Movie> movieitem=[
  @override
  void initState() {
    loadMovies();
    super.initState();
  }
  List movie=[];
  List topRatedMovies=[];
  List tv=[];

  final String apiKey='354f43538320261ad5d587b8c0e0e58b';
  final readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTRmNDM1MzgzMjAyNjFhZDVkNTg3YjhjMGUwZTU4YiIsInN1YiI6IjY1OWU4NWU4OTFiNTMwMDBlZjFlZTc5NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Lf9jwWn6CxnNPrI5qACgeuI2mBUn7US_8WQldrYx9qQ';
  loadMovies()async{
  TMDB tmdbWithCustomLogs= TMDB(ApiKeys(apiKey, readAccessToken),logConfig: ConfigLogger(showLogs: true,showErrorLogs: true));
  Map moviesResults= await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topRatedResults= await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvResults= await tmdbWithCustomLogs.v3.tv.getPopular();

  setState(() {
    movie=moviesResults['results'];
    topRatedMovies=topRatedResults['results'];
    tv=tvResults['results'];
  });
  print(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          
          TopRated(toprated: topRatedMovies),
          Movie(movielist: movie),
           TV(tv: tv),
        ],
      )
      
    );
  }
}
