
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_architecture/app/data/home_model.dart';
List<HomeModel>ListOfCategories=[];

class CategoryAddPageSuccessfullyController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void addToMyList( list){
    ListOfCategories.add(list);
    print("The length of${ListOfCategories.length} ");
    update();
  }
}
