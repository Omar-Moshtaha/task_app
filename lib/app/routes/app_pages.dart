import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/views/add_results_page_view.dart';
import 'package:project_architecture/app/modules/home/views/categories_selection_page.dart';
import 'package:project_architecture/app/modules/home/views/category_add_page_successfully_view.dart';
import 'package:project_architecture/app/modules/home/views/policy_and_privacy_page_view.dart';
import 'package:project_architecture/app/modules/home/views/search_result_view.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_view.dart';


import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.categoriesSelectionPage;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PolicyAndPrivacyPage,
      page: () =>  PolicyAndPrivacyPage(),
      binding: HomeBinding(),

    ),
    GetPage(
      name: _Paths.resultPageView,
      page: () =>  ResultPageView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.categoriesSelectionPage,
      page: () =>  CategoriesSelectionPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.unitsInformationPage,
      page: () =>  UnitsInformationPage(),
    ),
    GetPage(
      name: _Paths.CategoryAddPageSuccessfully,
      page: () =>  CategoryAddPageSuccessfully(),
    ),
    GetPage(
      name: _Paths.SearchResultPage,
      page: () =>  SearchResultPage(),
      binding: HomeBinding(),

    ),
    GetPage(name: _Paths.CategoryAddPageSuccessfully, page:()=> CategoryAddPageSuccessfully(),  binding: HomeBinding()),

  ];
}
