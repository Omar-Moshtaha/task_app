import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/controllers/categories_selection_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/category_add_page_successfully_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/policy_and_privacy_page_controllers.dart';
import 'package:project_architecture/app/modules/home/controllers/result_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/search_result_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/units_information_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),fenix: true
    );
    Get.lazyPut<ResultController>(
          () => ResultController(),fenix: true,
    );
    Get.lazyPut<CategoriesSelectionController>(() =>
        CategoriesSelectionController(),fenix: true);
    Get.lazyPut<UnitsInformationController>(() =>
        UnitsInformationController(),fenix: true);
Get.lazyPut<SearchResultController>(() =>SearchResultController(),fenix: true );
    Get.lazyPut<policyAndPrivacyPageControllers>(() =>policyAndPrivacyPageControllers() ,fenix: true);
    Get.lazyPut<CategoryAddPageSuccessfullyController>(() =>CategoryAddPageSuccessfullyController(),fenix: true);


  }


}
