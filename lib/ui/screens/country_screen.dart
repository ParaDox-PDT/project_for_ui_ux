import 'package:flutter/material.dart';

import 'package:flutter_defualt_project/data/models/country_models/country_model.dart';
import 'package:flutter_defualt_project/utils/view_model/country_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreen();
}

class _CountriesScreen extends State<CountriesScreen> {
  _init() async {
    context.read<CountryProvider>().getAllCountry();
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
          backgroundColor: Colors.blueAccent,
          title: Text(
            "Countries",
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
                context.read<CountryProvider>().countries.length,
                    (index) {
                  CountryModel countryModel =
                  context.read<CountryProvider>().countries[index];
                  return ListTile(
                    title: Text(
                      "Country: ${countryModel.name}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        text: "Capital: ${countryModel.capital}",
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "\nCurrency: ${countryModel.currency}",
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    trailing: RichText(
                      text: TextSpan(
                        text: "Phone: ${countryModel.phone}\n",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "${countryModel.continentModel.name}\n",
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: countryModel.emoji,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
