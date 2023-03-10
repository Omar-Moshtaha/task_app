import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/data/room_model.dart';
import 'package:project_architecture/app/data/stepper_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  bool value=false;
  bool myChoose=false;
  bool myTwoChoose=false;
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
List  daysOfWeek=[
  'الجمعة','الخميس','الأربعاء','الثلاثاء','الإثنين','الأحد'
];
List days=[];
  var textForm1=TextEditingController();

  var pricePerNight=TextEditingController();

  List<RoomModel>rooms=[
    RoomModel("عدد الأسرة المزدوجة","3"),
    RoomModel("عدد الأسرة الفردية","2"),
    RoomModel("عدد أسرة الأريكة","3"),
  ];

  List <StepperModel>step=[
    StepperModel("3", false,false),
    StepperModel("2", false,false),
    StepperModel("1", true,false),

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

    step[index].value = true;
    step[index].valueOfDiveder = true;
    print(step[2].value);
    print(step[2].valueOfDiveder);

    update();

}
  void changeValueOfMyChoose(){
    myChoose=!myChoose;
    update();
  }
  void changeValueOfMyTwoChoose(){
    myTwoChoose=!myTwoChoose;
    update();
  }
}
