import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TV extends StatefulWidget {
  const TV({super.key, required this.tv});
  final List tv;

  @override
  State<TV> createState() => _TvState();
}

class _TvState extends State<TV> {
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
                child: Text('TV Shows',style: TextStyle(color: Colors.black54,fontSize: 30),)),
            SizedBox(height: 20.h,),
            Container(
                height: 270,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.tv.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.network('https://image.tmdb.org/t/p/w500'+widget.tv[index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(widget.tv[index]['original_name']!=null? widget.tv[index]['original_name']:'Loading...',style: TextStyle(fontSize: 15.sp,color: Colors.black54),),
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
