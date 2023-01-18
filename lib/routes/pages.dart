
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:manage_peoples/routes/routes.dart';
import 'package:manage_peoples/views/blog/binding.dart';
import 'package:manage_peoples/views/blog/detail/binding.dart';
import 'package:manage_peoples/views/blog/detail/view.dart';
import 'package:manage_peoples/views/blog/view.dart';
import 'package:manage_peoples/views/home/view.dart';
import 'package:manage_peoples/views/login/view.dart';
import 'package:manage_peoples/views/people/view.dart';

class CommonPage {
  static List pages = [
    RouteModel(
      RouteNames.PEOPLE,
      PeopleView(),
    ),
  ];
}

class RouteModel {
  String name;
  Widget page;

  RouteModel(this.name, this.page);
}

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouteNames.HOME,
        page: () => HomeView(),
        // binding: HomeBinding(),
      ),
      GetPage(
        name: RouteNames.LOGIN,
        page: () => LoginView(),
        // binding: HomeBinding(),
      ),
      GetPage(
        name: RouteNames.BLOG,
        page: () => BlogView(),
        binding: BlogBinding(),
      ),
      GetPage(
        name: RouteNames.PEOPLE,
        page: () => PeopleView(),
        // binding: LanguageBinding(),
      ),
      GetPage(
        name: RouteNames.blogDetail, 
        page: () => const DetailView(),
        // binding: BlogDetailBinding()
      )
    ];
    }
  }