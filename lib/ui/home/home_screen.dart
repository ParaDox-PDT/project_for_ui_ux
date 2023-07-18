import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/user/user_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';
import 'package:flutter_defualt_project/data/network/api_repository.dart';
import 'package:flutter_defualt_project/ui/home/widgets/row_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  late UserModel userModel;
  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());

  _getUserData() async {
    setState(() {
      isLoading = true;
    });
    userModel = await apiRepository.getUserData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.network(userModel.pictureModel.large),
                      ),
                    ],
                  ),
                  RowItems(
                    title: userModel.nameModel.title,
                    first: userModel.nameModel.first,
                    last: userModel.nameModel.last,
                    icon: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  RowItems(
                    title:
                        "${userModel.locationModel.country} ${userModel.locationModel.state} ${userModel.locationModel.city}",
                    last:
                        "${userModel.locationModel.streetModel.name} ${userModel.locationModel.streetModel.number}",
                    first: "",
                    icon: const Icon(Icons.location_on),
                  ),
                  RowItems(
                      title: userModel.email,
                      first: "",
                      last: "",
                      icon: const Icon(Icons.email)),
                  RowItems(
                      title: "Username: ${userModel.loginModel.username}",
                      first: "Password: ${userModel.loginModel.password}",
                      last: "|",
                      icon: const Icon(Icons.person)),
                  RowItems(
                      title: userModel.phone,
                      first: "",
                      last: "",
                      icon: const Icon(Icons.phone)),
                  RowItems(
                      last: userModel.dobModel.age.toString(),
                      first: "",
                      title: "Age: ",
                      icon: const Icon(Icons.cake))
                ],
              ),
            ),
    );
  }
}
