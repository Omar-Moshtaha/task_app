
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
List? myList;

class policyAndPrivacyPageControllers extends GetxController {


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
Future<void> addToListCategories(value) async {
    myList=[];
 myList =value;
 print(myList);
 update();
}
}
