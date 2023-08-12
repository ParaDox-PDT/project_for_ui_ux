import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/company_model/company_model.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/utils/view_model/country_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreen();
}

class _CompaniesScreen extends State<CompaniesScreen> {
  _init() async {
    context.read<CountryProvider>().getAllCompanies();
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
          "Companies",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: context.watch<CountryProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                ...List.generate(
                  context.read<CountryProvider>().companies.length,
                  (index) {
                    CompanyModel companyModel =
                        context.read<CountryProvider>().companies[index];
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: companyModel.logo,
                        width: 100.w,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(
                        "Model: ${companyModel.carModel}",
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        "Established Year: ${companyModel.establishedYear}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing:Text(
                        "Price: ${companyModel.averagePrice}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(20.r),
                      onTap: (){
                        Navigator.pushNamed(context, RouteNames.companyDetailScreen,arguments: companyModel.id.toString());
                      },
                    );
                  },
                )
              ],
            ),
    );
  }
}
