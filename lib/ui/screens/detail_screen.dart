import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/view_model/country_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  _init() async {
    context.read<CountryProvider>().getCar(id: widget.id);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Screen",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                  imageUrl: context.watch<CountryProvider>().carModel!.logo),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  context.watch<CountryProvider>().carModel!.carModel,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Established Year: ${context.watch<CountryProvider>().carModel!.establishedYear}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Average price: ${context.watch<CountryProvider>().carModel!.averagePrice}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Description: ${context.watch<CountryProvider>().carModel!.description}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
              ...List.generate(
                context.watch<CountryProvider>().carModel!.carPics.length,
                (index) => Padding(
                  padding:EdgeInsets.symmetric(vertical: 10.h),
                  child: CachedNetworkImage(
                    imageUrl:
                        context.watch<CountryProvider>().carModel!.carPics[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
