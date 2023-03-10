import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/controllers/categories_selection_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/result_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/units_information_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ResultController>(
          () => ResultController(),
    );
    Get.lazyPut<CategoriesSelectionController>(() =>
        CategoriesSelectionController(),fenix: true);
    Get.lazyPut<UnitsInformationController>(() =>
        UnitsInformationController(),fenix: true);

  }

}
