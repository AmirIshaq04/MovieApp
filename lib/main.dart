import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';  // Import the Get package
import 'package:video_player/controllers/movie_controller.dart';
import 'package:video_player/controllers/top_rated_controller.dart';
import 'package:video_player/controllers/tv_controller.dart';
import 'package:video_player/pages/home_page.dart';

void main() {
  // Initialize controllers before runApp
  Get.put(MovieController());
  Get.put(TopRatedController());
  Get.put(TVController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: HomePage(),
    );
  }
}
