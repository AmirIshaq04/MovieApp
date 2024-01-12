import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRated extends StatelessWidget {
  TopRated({super.key, required this.toprated});
  final List toprated;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Align(
              alignment: Alignment.topLeft,
                child: Text('On Trend',style: TextStyle(color: Colors.black54,fontSize: 30),)),
            SizedBox(height: 20.h,),
            Container(
                height: 270,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.network('https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(toprated[index]['original_title']!=null? toprated[index]['original_title']:'Loading...',style: TextStyle(fontSize: 15.sp,color: Colors.black54),),
                          )
                        ],
                      ),
                    );
                  },)
            ),
          ],
        ),
      ),
    );
  }
}
