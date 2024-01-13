import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/controllers/movie_controller.dart';

class Movie extends StatelessWidget {
  const Movie({Key? key, this.movielist}) : super(key: key);
  final movielist;

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.put(MovieController());

    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Movies',
                style: TextStyle(color: Colors.black54, fontSize: 30),
              ),
            ),
            SizedBox(height: 20.h),
            Obx(
                  () {
                final movies = movielist ?? movieController.movies;

                return movieController.isLoading.value
                    ? CircularProgressIndicator()
                    : Container(
                  height: 270,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      // Access properties from Movie class
                      String title = movies[index].title;
                      String posterUrl = movies[index].posterUrl;

                      return Container(
                        child: Column(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500' +
                                        posterUrl,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                title != null ? title : 'Loading...',
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
