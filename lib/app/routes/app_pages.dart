import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/views/add_category_details_page_succeeded_view.dart';
import 'package:project_architecture/app/modules/home/views/add_results_page_view.dart';
import 'package:project_architecture/app/modules/home/views/categories_selection_page.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_veiw.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_veiw.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_veiw.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/units_information_page_veiw.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.addCategorydCtailsPageSucceeded,
      page: () =>  AddCategorydetailsPageSucceeded(),
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
  ];
}
