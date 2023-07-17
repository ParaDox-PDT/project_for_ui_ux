import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';
import 'package:flutter_defualt_project/data/network/api_repository.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  String firstLang = "en";
  String secondLang = "uz";
  String thirdLang="";
  String emptyText="";
  TextEditingController controller = TextEditingController();

  String translatedText = "Bu yerga yozing";
  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());

  _translateText(String text,String first, String second)async{
    if(text.isEmpty){
      if(firstLang=="eng"){
        text="Shu yerga yozing";
      }
      else{
        text="Write here";
      }
    }
    translatedText = await apiRepository.translate(text: text, firstLang: first, secondLang: second);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Translate screen",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (value) {
                _translateText(controller.text, firstLang, secondLang);
              },
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Write here",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(width: 1, color: AppColors.black)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(width: 1, color: AppColors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(width: 1, color: AppColors.black)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(width: 1, color: AppColors.black)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          const BorderSide(width: 1, color: AppColors.black))),
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstLang,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 50.w,
                ),
                ZoomTapAnimation(
                  onTap: (){
                    thirdLang=firstLang;
                    firstLang=secondLang;
                    secondLang=thirdLang;
                    emptyText=translatedText;
                    translatedText=controller.text;
                    controller.text=emptyText;
                    setState(() {

                    });
                  },
                  child: const Icon(
                    Icons.compare_arrows,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  secondLang,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              padding: const EdgeInsets.all(14),
              height: 270.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 1, color: AppColors.black)),
              child: Text(
                translatedText,
                maxLines: 10,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
