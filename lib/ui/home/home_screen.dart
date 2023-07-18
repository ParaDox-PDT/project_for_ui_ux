import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/google_search/google_search_model.dart';
import 'package:flutter_defualt_project/data/models/google_search/organic_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';
import 'package:flutter_defualt_project/data/network/api_repository.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  int currentPage = 1;
  int countOfItems = 5;
  String queryText = "";
  bool isLoading = false;
  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());
  late GoogleSearchModel googleSearchModel;
  List<OrganicModel> organics = [];
  List<String> queries = StorageRepository.getList("queries").toSet().toList();

  _getResults() async {
    setState(() {
      isLoading = true;
    });
    googleSearchModel = await apiRepository.getSearchData(
        query: queryText, page: currentPage, count: countOfItems);
    organics.addAll(googleSearchModel.organics);
    setState(() {
      isLoading = false;
      queries.add(queryText);
      queries=queries.toSet().toList();
      StorageRepository.putList("queries", queries);
      currentPage++;
    });
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _getResults();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Image.asset(AppImages.google),
        // title: Lottie.asset(AppIcons.googleIcon),
        // leading: Lottie.asset(AppIcons.googleIcon),
        title: Text(
          "Google",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                style: Theme.of(context).textTheme.titleLarge,
                textInputAction: TextInputAction.search,
                onChanged: (v) {
                  queryText = v;
                },
                onSubmitted: (v) {
                  setState(() {
                    organics = [];
                    currentPage = 1;
                  });
                  focusNode.unfocus();
                  _getResults();
                },
                focusNode: focusNode,
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search here",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
              ),
            ),
            Container(
              height: 50.h,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      queries.length,
                      (index) => ZoomTapAnimation(
                        onTap: (){
                          setState(() {
                            organics = [];
                            queryText=queries[index];
                            controller.text=queries[index];
                            currentPage = 1;
                          });
                          _getResults();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(width: 1,color: Colors.black)
                          ),
                          child: Center(child: Text(queries[index])),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  ...List.generate(
                    organics.length,
                    (index) {
                      OrganicModel organicModel = organics[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.grey.shade200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ZoomTapAnimation(
                                onTap: () async {
                                  await launchUrl(
                                      Uri.parse("${organicModel.link}"));
                                },
                                child: Text(
                                  organicModel.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                )),
                            ZoomTapAnimation(
                                onTap: () async {
                                  await launchUrl(
                                      Uri.parse("${organicModel.link}"));
                                },
                                child: Text(
                                  organicModel.link,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            Text(
                              organicModel.snippet,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            organicModel.imageUrl.isNotEmpty
                                ? Image.network(
                                    organicModel.imageUrl,
                                    fit: BoxFit.fill,
                                  )
                                : SizedBox(
                                    height: 0,
                                  )
                          ],
                        ),
                      );
                    },
                  ),
                  Visibility(
                    child: Center(child:Lottie.asset(AppIcons.google)),
                    visible: isLoading,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
