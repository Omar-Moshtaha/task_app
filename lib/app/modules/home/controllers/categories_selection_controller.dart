import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoriesSelectionController extends GetxController {
var textForm1=TextEditingController();
var textForm2=TextEditingController();
String? categorySelected;
bool addCustomRating=false;
List categories=[
  "ستاندرد",
  "ديلوكس",
  "بريمير",

];
List <Map<dynamic,dynamic>>tasnifati=[];
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
void changeValueOfCustomRating(){
  addCustomRating=!addCustomRating;
  update();
}
void changeValueOfCategorySelected(value){
  categorySelected=value;

  if( tasnifati.any((item)=>item.containsValue(value))){
  }else{
    tasnifati.add({"categorySelected":"$categorySelected","number":0,"value":true});
    print(tasnifati);

  }
  update();
}
void  deleteFromCategory(value){
    tasnifati.removeWhere((element) => element==value);

    print(tasnifati);
    update();
}
void addMyCustomRating(value){
  if(tasnifati.any((item)=>item.containsValue(value))){
  }else{
    tasnifati.add({"categorySelected":"$value","number":0,"value":false});
    print(tasnifati);

  }
  update();
}
}
