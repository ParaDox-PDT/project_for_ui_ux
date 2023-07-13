import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';


class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key, required this.title, required this.img, required this.subtitle, required this.price, required this.gram});
  final String title;
  final String img;
  final String subtitle;
  final String price;
  final String gram;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.C_22222A
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h,),
            Image.asset(img,height: 100.h,),
            SizedBox(height: 12.h,),
            Text(title,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 12.h,),
            Text(subtitle,style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 8.h,),
            Row(
              children: [
                Text(price,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),),
                SizedBox(width: 22.w,),
                Container(
                  width: 38.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.C_16151B
                  ),
                  child: Center(child: Text(gram,style: Theme.of(context).textTheme.labelSmall,),),
                ),
                SizedBox(width: 10.w,),
                ZoomTapAnimation(
                  child:  Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.bigEllipse),
                        Icon(Icons.add,size: 30.w,)
                      ],
                    ),
                  ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
