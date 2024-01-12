import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Movie extends StatelessWidget {
   Movie({super.key, required this.movielist});
 final List movielist;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.bottomLeft,
                child: Text('Movies',style: TextStyle(color: Colors.black54,fontSize: 30),)),
            SizedBox(height: 20.h,),
            Container(
              height: 270,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                  itemCount: movielist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                               child: Image.network('https://image.tmdb.org/t/p/w500'+movielist[index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(movielist[index]['title']!=null? movielist[index]['title']:'Loading...',style: TextStyle(fontSize: 15.sp,color: Colors.black54),),
                          )
                        ],
                      ),
                    );
                  },)
            )
          ],
        ),
      ),
    );
  }
}
