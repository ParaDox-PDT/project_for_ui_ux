import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RowItems extends StatelessWidget {
  const RowItems({super.key, required this.title, required this.first, required this.last, required this.icon});
  final String title;
  final String first;
  final String last;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Row(
          children: [
            icon,
            SizedBox(width: 10.w,),
            SizedBox( width: 290.w,child: Text("$title $last $first",maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black),))
          ],
        )
      ],
    );
  }
}

