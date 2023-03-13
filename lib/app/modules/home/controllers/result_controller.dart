import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_architecture/app/data/result_model.dart';

class ResultController extends GetxController {
  List<ResultModel> modelItem = [
    ResultModel("جدة - حي النهضة", "assets/images/location.png",
        "الإتجال الشمالي", "assets/images/signpost.png"),
    ResultModel("فيلا", "assets/images/layer.png", "مساحة الوحدة 100 م²",
        "assets/images/ruler.png"),
    ResultModel("عوائل وشباب", "assets/images/Group.png", "4 وحدات",
        "assets/images/house-2.png"),
    ResultModel("4 مجالس", "assets/images/chair.png", "1 غرف نوم",
        "assets/images/Bed.png")
  ];

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
}
