import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/users/user_model.dart';
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
  int countOfItems = 10;
  bool isLoading = false;
  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());
  List<UserModel> users=[];


  _getResults() async {
    setState(() {
      isLoading = true;
    });
    users=await apiRepository.getUsers(page: currentPage, count: countOfItems);
    currentPage++;
    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState() {
    _getResults();
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
        child: isLoading?Center(child: CircularProgressIndicator()):Column(
          children: [
            Expanded(child: ListView(
              children: [
                ...List.generate(users.length, (index) => ListTile(
                  title: Text(users[index].name),
                ))
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
