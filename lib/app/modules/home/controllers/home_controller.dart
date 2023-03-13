import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/data/home_model.dart';
import 'package:project_architecture/app/data/stepper_model.dart';

int countOfList = 0;

class HomeController extends GetxController {
  RxInt count = 0.obs;
List informationOfCategory=[];
  bool value=false;
  List<HomeModel>homeModel=[];
  void changeValueOfSwitchValue(){
    switchValue=!switchValue;
    update();
  }
  bool switchValue=false;

  bool myChoose=false;
  bool myTwoChoose=false;
bool isVisible=true;
  bool myFourChoose=false;
  bool myThreeChoose=false;
var dinningTable=TextEditingController();
  String ?myValue;
int index=0;
List item=['شباب','عائلات','شباب و عائلات'];
  List typeOfBoard=['خيمة','غرفة معيشة','جلسة','مجلس'];
List councilFacilities=['تكييف','تدفئة','مرش رذاذ','موقد','مشوى','تلفاز','ألعاب إلكترونية','أرجوحة'];
List kitchenFacilities=[
  'ثلاجة',
  'فرن',
  'مايكرو ويف',
  'غلاية',
  'أواني طبخ'
];
  final Completer<GoogleMapController> googleMapController =
  Completer<GoogleMapController>();

  CameraPosition googlePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
List  daysOfWeek=[
  'الجمعة','الخميس','الأربعاء','الثلاثاء','الإثنين','الأحد'
];
List days=[];
List weekend=[];
  var textForm1=TextEditingController();
var numberOfSeats=TextEditingController();
RxInt numberOfRooms=0.obs;
  var pricePerNight=TextEditingController();
void changeValueOfDrowdwonButtom(value){
  myValue=value;
  update();

}

  List <StepperModel>step=[
    StepperModel("3", false,false),
    StepperModel("2", false,false),
    StepperModel("1", true,false),

  ];


  @override
  void onReady() {
    // changeValueOfcountOfList();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  IconData ?iconData=Icons.keyboard_arrow_up;
  void changeValue(){
    value=!value;
    value==true?iconData=Icons.keyboard_arrow_up:iconData=Icons.keyboard_arrow_down_rounded;
    update();
  }
  void changeValueOfIndex(value){
    index=value;
    update();
  }
  List listDirectione=['الشرق',"الغرب","الجنوب","الشمال"];
  List numberOfStepper=[];
Future<void> changeValueOfStepper(index) async {
if(step[2].value==true&&step[1].value==true){
  step[0].value=true;
  step[0].valueOfDiveder=true;
  isVisible=false;
print("The value is$isVisible");
  update();

}else{
  print("omar");
  step[index].value=true;
  step[index].valueOfDiveder=true;
  update();
}




}
  void changeValueOfMyChoose(){
    myChoose=!myChoose;

    update();
  }
  List dataOfRoom=[];
  void changeValueOfMyTwoChoose(){
    myTwoChoose=!myTwoChoose;
    update();
  }
  void changeValueOfMyThreeChoose(){
    myThreeChoose=!myThreeChoose;
    update();
  }
  void changeValueOfMyFourChoose(){
    myFourChoose=!myFourChoose;
    update();
  }
  void increaseTheNumber(){
    count++;
    update();
  }
  void decreaseTheNumber(){
  if(count>0){
    count--;
  }
    update();
  }
  void increaseTheNumberOfRooms(){
    numberOfRooms++;
    dataOfRoom.add({
      "NumberOfRooms":numberOfRooms.value,
      "Number_of_double_beds":TextEditingController(),
      "number_of_single_beds":TextEditingController(),
      "number_of_sofa_beds":TextEditingController(),

    });
    update();
  }
  void decreaseTheNumberOfRooms(){
    if(numberOfRooms>0){
      numberOfRooms--;
      update();

    }
  }
  void deleteRoom(index){
    numberOfRooms--;
    dataOfRoom.removeAt(index);
    update();
  }
void addToListDays(index){

  if(days.contains(daysOfWeek[index])) {
    days.remove(daysOfWeek[index]);
update();
  }else{
    days.add(daysOfWeek[index]);
    update();
  }

}
  void addToListweekend(index){
    if(weekend.contains(daysOfWeek[index])){

      weekend.remove(daysOfWeek[index]);
      update();

    }else{
      weekend.add(daysOfWeek[index]);
      update();
    }

  }
  bool isBash=false;
  void changeValueOfcountOfList(){
    countOfList++;
    print("The countOfList is${countOfList}");
update();
  }
}
