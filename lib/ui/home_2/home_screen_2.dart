import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/home_2/widgets/gred_view_items.dart';
import 'package:flutter_defualt_project/ui/home_2/widgets/header_view_item.dart';
import 'package:flutter_defualt_project/ui/home_2/widgets/list_view_items.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/icons.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<String> titles = [
    "Чикен Бургер",
    "Блэк Бургер",
    "Дабл Бургер",
    "BBQ Бургер",
    "Шеф Бургер",
  ];
  List<String> images = [
    AppImages.chickenBurger1,
    AppImages.blackBurger,
    AppImages.chickenBurger2,
    AppImages.chickenBurger3,
    AppImages.chickenBurger4,
  ];
  List<String> subtitles = [
    "Котлета куриная, свежие \nовощи, сыр чеддер, соус \nдля бургера",
    "Котлета свино-говяжья,\nсвежие овощи, сыр чеддер,\nсоус для бургера",
    "Булка с кунжутом тройная, \n2 котлеты с \nсолью и перцем, лист..",
    "Котлета свино-говяжья,\nсоленый огурец, свежие \nовощи, бекон, сыр чед..",
    "Котлета мраморной\nговядины, свежие овощи,\nсыр чеддер, соус для бу..",
  ];
  List<String> prices = [
    "₽160",
    "₽190",
    "₽230",
    "₽190",
    "₽220",
  ];
  List<String> grams = [
    "300g",
    "330g",
    "300g",
    "330g",
    "310g",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.C_111015,
        toolbarHeight: 20.h,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Привет, Максим",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: [
                            ZoomTapAnimation(
                                child: SvgPicture.asset(AppIcons.search)),
                            SizedBox(
                              width: 12.w,
                            ),
                            Image.asset(
                              AppImages.profileImg,
                              width: 36.w,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          colors: [AppColors.C_E1D24A, AppColors.C_C69233],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ваши любимые товары",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "Посмотреть все",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.C_EDB216),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                height: 114.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    GetListViewItem(
                        title: "Чикен Бургер",
                        img: AppImages.chickenBurger1,
                        subtitle:
                            "Котлета куриная, свежие\nовощи, сыр чеддер, \nсоус для бургера",
                        price: "₽160",
                        gram: "290g"),
                    GetListViewItem(
                        title: "Блэк Бургер",
                        img: AppImages.blackBurger,
                        subtitle:
                            "Котлета свино-говяжья,\nсвежие овощи, сыр чеддер,\nсоус для бургера",
                        price: "₽190",
                        gram: "330g"),
                    GetListViewItem(
                        title: "Дабл Бургер",
                        img: AppImages.chickenBurger2,
                        subtitle:
                            "Булка с кунжутом тройная, \n2 котлеты с солью и \nперцем, лист..",
                        price: "₽230",
                        gram: "300g"),
                    GetListViewItem(
                        title: "BBQ Бургер",
                        img: AppImages.chickenBurger3,
                        subtitle:
                            "Котлета свино-говяжья,\nсоленый огурец, свежие \nовощи, бекон, сыр чед..",
                        price: "₽190",
                        gram: "330g"),
                    GetListViewItem(
                        title: "Шеф Бургер",
                        img: AppImages.chickenBurger4,
                        subtitle:
                            "Котлета мраморной\nговядины, свежие овощи,\nсыр чеддер, соус для бу..",
                        price: "₽220",
                        gram: "310g"),
                  ],
                ),
              )
            ]),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverPersistentHeader(
                delegate: HeaderViewItem(),
                pinned: true,
              )),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 20.w,
              childAspectRatio: 0.82.h,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GridViewItems(
                    title: titles[index],
                    img: images[index],
                    subtitle: subtitles[index],
                    price: prices[index],
                    gram: grams[index]);
              },
              childCount: 5,
            ),
          )
        ],
      ),
      bottomNavigationBar:
       Theme(data: Theme.of(context).copyWith(
           canvasColor: AppColors.C_18171C,
           primaryColor: AppColors.C_18171C,
           ), child: BottomNavigationBar(
         backgroundColor: AppColors.C_18171C,
         currentIndex: 2,
         items: [
           BottomNavigationBarItem(
               icon: SvgPicture.asset(AppIcons.home), label: "",),
           BottomNavigationBarItem(
               icon: SvgPicture.asset(AppIcons.offer), label: ""),
           BottomNavigationBarItem(
               icon:Stack(
                 alignment: Alignment.center,
                 children: [
                   SvgPicture.asset(AppIcons.rectangle),
                   SvgPicture.asset(AppIcons.buy),
                 ],
               ) , label: ""),
           BottomNavigationBarItem(
               icon: SvgPicture.asset(AppIcons.heart), label: ""),
           BottomNavigationBarItem(
               icon: SvgPicture.asset(AppIcons.smile), label: ""),
         ],
       )),
    );
  }
}
