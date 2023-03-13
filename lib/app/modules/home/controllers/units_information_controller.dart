import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_architecture/app/data/unit_information_model.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_view.dart';

class UnitsInformationController extends GetxController {
  List<UnitInformationModel> unitListModel = [];

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

  IconData? iconData = Icons.keyboard_arrow_up;

  void changeValue(bool value, index) {
    list[index]['value'] = !list[index]['value'];
    list[index]['value'] == true
        ? iconData = Icons.keyboard_arrow_up
        : iconData = Icons.keyboard_arrow_down_rounded;
    print("my value is$value");

    // print(value);
    update();
  }

  void supplyOverTheCounter(index) {
    list[index]['number']++;
    unitListModel.add(UnitInformationModel(
        index, "الوحدة ${list[index]['number']}", TextEditingController()));
    update();
  }

  void diminishmentOfTheCounter(index) {
    if (list[index]['number'] > 0) {
      list[index]['number']--;
      unitListModel.removeLast();
      update();
    }
  }

  Future<void> addToUnitInformationDetails() async {
    unitInformationDetails = [];

    for (int i = 0; i < list.length; i++) {
      unitInformationDetails.add({
        "Category": list[i]['categorySelected'],
        "numberOfRoom": list[i]['number'],
        "NumberUnit": "${list[i]['NumberUnit']}",
      });
    }
    for (int i = 0; i < unitInformationDetails.length; i++) {
      if (unitInformationDetails[i]['numberOfRoom'] == 0) {
      } else {
        print(unitInformationDetails);
        Get.offAllNamed('PolicyAndPrivacyPage',
            arguments: unitInformationDetails);
      }
    }

    update();
  }
}
