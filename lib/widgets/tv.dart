import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/controllers/tv_controller.dart';

class TV extends StatelessWidget {
  const TV({Key? key, this.tv}) : super(key: key);
  final tv;

  @override
  Widget build(BuildContext context) {
    final TVController tvController = Get.put(TVController());

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
                'TV Shows',
                style: TextStyle(color: Colors.black54, fontSize: 30),
              ),
            ),
            SizedBox(height: 20.h),
            Obx(
                  () => tvController.isLoading.value
                  ? CircularProgressIndicator()
                  : Container(
                height: 270,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tvController.tvShows.length,
                  itemBuilder: (context, index) {
                    final tvShow = tvController.tvShows[index];

                    return Container(
                      child: Column(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tvShow.posterPath,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              tvShow.originalName,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
