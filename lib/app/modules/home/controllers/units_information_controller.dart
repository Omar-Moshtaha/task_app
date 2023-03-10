import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_architecture/app/data/unit_information_model.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_veiw.dart';

class UnitsInformationController extends GetxController {


  List<UnitInformationModel>unitListModel=[


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
  IconData ?iconData=Icons.keyboard_arrow_up;
  void changeValue(bool value,index){
    list[index]['value']= !list[index]['value'];
    list[index]['value']==true?iconData=Icons.keyboard_arrow_up:iconData=Icons.keyboard_arrow_down_rounded;
    print("my value is$value");

    // print(value);
    update();
  }
  void supplyOverTheCounter(index){
    list[index]['number']++;
    unitListModel.add(UnitInformationModel(index,"الوحدة ${list[index]['number']}",TextEditingController()));
    update();
  }
  void diminishmentOfTheCounter(index){
    if(list[index]['number']>0){
      list[index]['number']--;
      unitListModel.removeLast();
      update();
    }

  }

}
