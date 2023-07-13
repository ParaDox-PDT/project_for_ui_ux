import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/home_2/widgets/zoomtap_item.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/images.dart';

class HeaderViewItem extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.C_111015,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Все товары",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text("Посмотреть все",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.C_EDB216,
                          ))
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 30.h,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ZoomTapAnimation(
                      child: Container(
                        margin:EdgeInsets.symmetric(horizontal: 5.w),
                        padding: const EdgeInsets.all(6),
                        width: 80.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.C_E1D24A, AppColors.C_C69233],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppImages.burgerIcon,width: 16.w,),
                            Text("Бургеры",style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.black),),
                          ],
                        ),
                      ),
                    ),
                    const GetZoomTapItem(title: "Пицца", img: AppImages.pizzaIcon),
                    const GetZoomTapItem(title: "Фрэнч Доги", img: AppImages.frenchIcon),
                    const GetZoomTapItem(title: "Снэки", img: AppImages.freeIcon),
                    const GetZoomTapItem(title: "Бургеры", img: AppImages.burgerIcon),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
