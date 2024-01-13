import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../models/model_class.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key, this.toprated}) : super(key: key);
  final toprated;

  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  late Future<List<Movie>> futureTopRated;

  @override
  void initState() {
    super.initState();
    futureTopRated = fetchTopRated();
  }

  Future<List<Movie>> fetchTopRated() async {
    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=354f43538320261ad5d587b8c0e0e58b'));

      if (response.statusCode == 200) {
        final List<Movie> topRated = (json.decode(response.body)['results'] as List<dynamic>)
            .map((item) => Movie(
          title: item['original_title'] ?? 'Loading...',
          releaseDate: item['release_date'] ?? 'N/A',
          overview: item['overview'] ?? 'No overview available.',
          posterUrl: item['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w500' + item['poster_path']
              : 'https://via.placeholder.com/150',
        ))
            .toList();
        return topRated;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'On Trend',
                style: TextStyle(color: Colors.black54, fontSize: 30),
              ),
            ),
            SizedBox(height: 20.h),
            FutureBuilder<List<Movie>>(
              future: futureTopRated,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                    height: 270,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final movie = snapshot.data![index];

                        return Container(
                          child: Column(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Image.network(movie.posterUrl),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  movie.title,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black54,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
