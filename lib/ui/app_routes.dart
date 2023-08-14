import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/screens/company_screen.dart';
import 'package:flutter_defualt_project/ui/screens/country_screen.dart';
import 'package:flutter_defualt_project/ui/screens/detail_screen.dart';
import 'package:flutter_defualt_project/ui/screens/dynamic_views_screen.dart';


import 'home/home_screen.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String countriesScreen = "/countries";
  static const String companiesScreen = "/companies";
  static const String companyDetailScreen = "/detail";
  static const String dynamicView = "/dynamic_view";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.companyDetailScreen:
        return MaterialPageRoute(
          builder: (context) =>  DetailScreen(id: settings.arguments as String,),
        );
      case RouteNames.dynamicView:
        return MaterialPageRoute(
          builder: (context) =>  DynamicViewsScreen(),
        );
      case RouteNames.countriesScreen:
        return MaterialPageRoute(
          builder: (context) => const CountriesScreen(),
        );
      case RouteNames.companiesScreen:
        return MaterialPageRoute(
          builder: (context) => const CompaniesScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
