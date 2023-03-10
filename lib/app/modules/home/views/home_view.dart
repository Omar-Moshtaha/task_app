import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_containe_for_step1_in_stepper.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          Center(child: PrimaryText("(تصنيف 2 من 2) ديلوكس",color: const Color(0XFF335C87),fontSize: 16.sp,)),
          Padding(
            padding:  EdgeInsets.only(right:10.w,left: 10.w),
            child: const Icon(Icons.arrow_forward_ios,color: Color(0XFF335C87),),
          ),
        ],
        flexibleSpace: Container(width: Get.width,height: Get.height,decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          boxShadow: const [
            BoxShadow(
              color:  Color(0x14000000),
              offset:  Offset(0, 2),
              blurRadius:  4,
            ),
          ],
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.r),bottomLeft: Radius.circular(20.r))
        ),),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(bottom: 20.h),
            child: GetBuilder<HomeController>(
              builder: (context){
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GetBuilder<HomeController>(
                        builder: (context){
                          return Padding(
                            padding:  EdgeInsets.only(right: 20.w,left: 20.w,top: 20.h),
                            child:   SizedBox(height: 50,child: ListView.separated(shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (context,index)=>CircleAvatar(backgroundColor: controller.step[index].value==true?const Color(0xFFD84E67):const Color(0xFFF1F1F1),child: PrimaryText("${controller.step[index].number}",fontSize: 14.sp,color: controller.step[index].value==true?const Color(0xFFFFFFFF):const Color(0xFF707070),fontWeight: FontWeight.w400,),), separatorBuilder: (context,index)=>Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(height: 2.h,width: Get.width/3.3,color:controller.step[index].valueOfDiveder==false? const Color(0xffFAFAFA):const Color(0xFFD84E67),),
                              ],
                            ), itemCount: 3)),
                          );
                        },
                      ),

                      controller.step[1].value==true?Container(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              PrimaryText("تفاصيل الوحدة",color: const Color(0XFFD84E67),fontSize: 16.sp,fontWeight: FontWeight.w700,),
                              const PrimaryDivider(0xfffc7c7c7),

                              PrimaryText("مساحة الوحدة",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                              SizedBox(height: 3.h,),
//
                              PrimaryTextField(hintText: " ادخال اسم التصينف",controller: controller.textForm1, validator: (String? value) {},),

                              PrimaryText("الإتجاه",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                              SizedBox(height: 3.h,),

                              Container(

                                width: Get.width,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r),
                                    color: const Color(0xFFFAFAFA),
                                    border: Border.all(color: const Color(0xFFEEF1F5))
                                ),
                                child:   DropdownButton(hint: const Text("الشمال"),icon: const Icon(Icons.arrow_drop_down_circle_outlined),underline: const SizedBox(),elevation: 0,value:controller.myValue ,items: controller.listDirectione.map((e){
                                  return DropdownMenuItem(value: e,child: Text("${e}"),);
                                }).toList(), onChanged: (value){}),
                              ),
                              SizedBox(height: 10.h,),
                              PrimaryText("شباب أو عائلات",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                              SizedBox(height: 10.h,),

                              SizedBox(
                                height: 35.h,

                                child:   ListView.separated(scrollDirection: Axis.horizontal,shrinkWrap: true,itemBuilder: (context,index)=>Container(
                                  decoration: BoxDecoration(
                                      color:controller.index==index?const Color(0xFFF3C8D0): const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(20.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:  Color(0x286d6d6d),
                                          offset:  Offset(2, 0),
                                          blurRadius:  4,
                                        ),
                                      ]
                                  ),
                                  width: 80.w,
                                  child: Center(child: GestureDetector(onTap: (){
                                    controller.changeValueOfIndex(index);
                                  },child: PrimaryText("${controller.item[index]}",fontSize: 12.sp,fontWeight: FontWeight.w400,))),
                                ), separatorBuilder: (context,index)=>SizedBox(width: 10.w,), itemCount: controller.item.length),
                              ),
                              SizedBox(height: 10.h,),

                              PrimaryText("يوصى بإختيار شباب وعائلات لزيادة فرصة حجز عقارك",color: const Color(0xFF9F9F9F),fontWeight: FontWeight.w400,fontSize: 12.sp,textAlign: TextAlign.right,),
                              SizedBox(height: 10.h,),

                              const Divider(color: Color(0xfffc7c7c7),),
                              SizedBox(height: 10.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                                Image.asset("assets/images/mins_with_background.png"),

                                SizedBox(width: 10.w,),
                                Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: const Color(0xFFFAFAFA),
                                    border: Border.all(color: const Color(0xFFEEF1F5))
                                ),child: Center(child: PrimaryText("2",color: const Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
                                SizedBox(width: 10.w,),
                                Image.asset("assets/images/add_with_background.png",),
                                const Spacer(),
                                PrimaryText("عدد المجالس/الجلسات",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 14.sp,textAlign: TextAlign.right,),

                              ],),
                              PrimaryText("نوع المجلس/الجلسة",color: const Color(0xFF335C87),fontWeight: FontWeight.w400,fontSize: 12.sp,textAlign: TextAlign.right,),
                              SizedBox(height: 10.h,),

                              SizedBox(
                                height: 35.h,

                                child:   ListView.separated(scrollDirection: Axis.horizontal,shrinkWrap: true,itemBuilder: (context,index)=>Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(20.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:  Color(0x286d6d6d),
                                          offset:  Offset(2, 0),
                                          blurRadius:  4,
                                        ),
                                      ]
                                  ),
                                  width: 80.w,
                                  child: Center(child: GestureDetector(onTap: (){
                                    controller.changeValueOfIndex(index);
                                  },child: PrimaryText("${controller.typeOfBoard[index]}",fontSize: 12.sp,fontWeight: FontWeight.w400,))),
                                ), separatorBuilder: (context,index)=>SizedBox(width: 10.w,), itemCount: controller.typeOfBoard.length),
                              ),
                              SizedBox(height: 10.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PrimaryText("خاص أو مشترك",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                                  SizedBox(height: 10.h,),
                                  Row(children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myChoose==true ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("مشترك",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myChoose==false ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("خاص",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),

                                  ],),
                                  SizedBox(height: 10.h,),
                                  PrimaryText("داخلي أو خارجي",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                                  SizedBox(height: 10.h,),

                                  Row(children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyTwoChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myTwoChoose==true ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("داخلي",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyTwoChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myTwoChoose==false ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("خارجي",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),

                                  ],),
                                ],
                              ),


                              SizedBox(height: 10.h,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: const Color(0xFFFAFAFA),
                                      border: Border.all(color: const Color(0xFFEEF1F5))
                                  ),child: Center(child: PrimaryText("2",color: const Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
                                  SizedBox(width: 20.w,),
                                  PrimaryText("عدد المقاعد/يتسع لـ",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),

                                ],
                              ),
                              SizedBox(height: 10.h,),
                              PrimaryText("مرافق المجلس/الجلسة",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                              SizedBox(height: 10.h,),

                              SizedBox(
                                width: Get.width,
                                child: Wrap(alignment:WrapAlignment.end ,direction: Axis.horizontal,children: List.generate(controller.councilFacilities.length, (index) =>   Padding(
                                  padding:  EdgeInsets.only(left:5.w ,top: 5.h,right: 0.w),
                                  child: Container(

                                    decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(20.r),
                                        boxShadow: const [
                                          BoxShadow(
                                            color:  Color(0x286d6d6d),
                                            offset:  Offset(2, 0),
                                            blurRadius:  4,
                                          ),
                                        ]
                                    ),
                                    width: 60.w,
                                    height: 30.h,
                                    child: Center(child: GestureDetector(onTap: (){
                                      controller.changeValueOfIndex(index);
                                    },child: PrimaryText("${controller.councilFacilities[index]}",fontSize: 10.sp,fontWeight: FontWeight.w400,))),
                                  ),
                                )),),
                              ),
                              SizedBox(height: 10.h,),
                              const Divider(color: Color(0xfffc7c7c7),),
                              SizedBox(height: 10.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                                Image.asset("assets/images/mins_with_background.png"),

                                SizedBox(width: 10.w,),
                                Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: const Color(0xFFFAFAFA),
                                    border: Border.all(color: const Color(0xFFEEF1F5))
                                ),child: Center(child: PrimaryText("2",color: const Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
                                SizedBox(width: 10.w,),
                                Image.asset("assets/images/add_with_background.png",),

                                SizedBox(width: 30.w,),
                                PrimaryText("عدد غرف النوم",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 14.sp,textAlign: TextAlign.right,),

                              ],),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      PrimaryText("حذف الغرفة",color: Color(0xFFD84E67),fontSize: 10,fontWeight: FontWeight.w700,),
                                      Spacer(),

                                      PrimaryText("غرفة رقم 1",color: Color(0xFFD84E67),fontSize: 10,fontWeight: FontWeight.w700,),

                                    ],),
                                  SizedBox(height: 10.w,),

                                  ListView.separated(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,index)=>Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.r),
                                          color: const Color(0xFFFAFAFA),
                                          border: Border.all(color: const Color(0xFFEEF1F5))
                                      ),child: Center(child: PrimaryText("${controller.rooms[index].roomNumber}",color: const Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
                                      SizedBox(width: 30.w,),
                                      SizedBox(width: 100.w,child: PrimaryText("${controller.rooms[index].roomName}",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,)),

                                    ],
                                  ), separatorBuilder: (context,index)=>SizedBox(height: 8.h,), itemCount: 3)
                                  ,
                                  SizedBox(height: 10.h,),
                                  PrimaryText("مرافق غرفة رقم 1",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                                  SizedBox(height: 10.h,),

                                  SizedBox(
                                    width: Get.width,
                                    child: Wrap(alignment:WrapAlignment.end ,direction: Axis.horizontal,children: List.generate(controller.councilFacilities.length, (index) =>   Padding(
                                      padding:  EdgeInsets.only(left:5.w ,top: 5.h,right: 0.w),
                                      child: Container(

                                        decoration: BoxDecoration(
                                            color: const Color(0xffffffff),
                                            borderRadius: BorderRadius.circular(20.r),
                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x286d6d6d),
                                                offset:  Offset(2, 0),
                                                blurRadius:  4,
                                              ),
                                            ]
                                        ),
                                        width: 60.w,
                                        height: 30.h,
                                        child: Center(child: GestureDetector(onTap: (){
                                          controller.changeValueOfIndex(index);
                                        },child: PrimaryText("${controller.councilFacilities[index]}",fontSize: 10.sp,fontWeight: FontWeight.w400,))),
                                      ),
                                    )),),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10.h,),
                              const Divider(color: Color(0xfffc7c7c7),),
                              SizedBox(height: 10.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      PrimaryText("حذف الغرفة",color: Color(0xFFD84E67),fontSize: 10,fontWeight: FontWeight.w700,),
                                      Spacer(),

                                      PrimaryText("غرفة رقم 2",color: Color(0xFFD84E67),fontSize: 10,fontWeight: FontWeight.w700,),

                                    ],),
                                  SizedBox(height: 10.w,),

                                  ListView.separated(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,index)=>Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.r),
                                          color: const Color(0xFFFAFAFA),
                                          border: Border.all(color: const Color(0xFFEEF1F5))
                                      ),child: Center(child: PrimaryText("${controller.rooms[index].roomNumber}",color: const Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
                                      SizedBox(width: 30.w,),
                                      SizedBox(width: 100.w,child: PrimaryText("${controller.rooms[index].roomName}",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,)),

                                    ],
                                  ), separatorBuilder: (context,index)=>SizedBox(height: 8.h,), itemCount: 3)
                                  ,
                                  SizedBox(height: 10.h,),
                                  PrimaryText("مرافق غرفة رقم 2",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                                  SizedBox(height: 10.h,),

                                  SizedBox(
                                    width: Get.width,
                                    child: Wrap(alignment:WrapAlignment.end ,direction: Axis.horizontal,children: List.generate(controller.councilFacilities.length, (index) =>   Padding(
                                      padding:  EdgeInsets.only(left:5.w ,top: 5.h,right: 0.w),
                                      child: Container(

                                        decoration: BoxDecoration(
                                            color: const Color(0xffffffff),
                                            borderRadius: BorderRadius.circular(20.r),
                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x286d6d6d),
                                                offset:  Offset(2, 0),
                                                blurRadius:  4,
                                              ),
                                            ]
                                        ),
                                        width: 60.w,
                                        height: 30.h,
                                        child: Center(child: GestureDetector(onTap: (){
                                          controller.changeValueOfIndex(index);
                                        },child: PrimaryText("${controller.councilFacilities[index]}",fontSize: 10.sp,fontWeight: FontWeight.w400,))),
                                      ),
                                    )),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              const Divider(color: Color(0xfffc7c7c7),),
                              SizedBox(height: 10.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PrimaryText("هل يتوفر مطبخ؟",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                                  SizedBox(height: 10.h,),
                                  Row(children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myChoose==true ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("نعم",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myChoose==false ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("لا",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),

                                  ],),
                                  SizedBox(height: 10.h,),
                                  PrimaryText("خاص أو مشترك",color: const Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,),
                                  SizedBox(height: 10.h,),

                                  Row(children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyTwoChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myTwoChoose==true ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("مشترك",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.changeValueOfMyTwoChoose();
                                        },
                                        child: Container(
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            border: Border.all(color:controller.myTwoChoose==false ?const Color(0XffD84E67):Colors.white),

                                            boxShadow: const [
                                              BoxShadow(
                                                color:  Color(0x14000000),
                                                offset:  Offset(0, 2),
                                                blurRadius:  4,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Center(child: PrimaryText("خاص",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF333333),)),
                                        ),
                                      ),
                                    ),

                                  ],),
                                ],

                              ),
                              SizedBox(height: 10.h,),

                              PrimaryText("طاولة طعام تسع إلى",fontSize: 12.sp,fontWeight: FontWeight.w700,color: const Color(0xFF335C87),),
                              SizedBox(height: 10.h,),

                              PrimaryTextField(hintText: "2", controller: controller.dinningTable, validator: (value){}),
                              PrimaryText("مرافق المطبخ",fontSize: 12.sp,fontWeight: FontWeight.w700,color: const Color(0xFF335C87),),
                              SizedBox(height: 10.h,),

                              SizedBox(
                                height: 35.h,

                                child:   ListView.separated(scrollDirection: Axis.horizontal,shrinkWrap: true,itemBuilder: (context,index)=>Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(20.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:  Color(0x286d6d6d),
                                          offset:  Offset(2, 0),
                                          blurRadius:  4,
                                        ),
                                      ]
                                  ),
                                  width: 80.w,
                                  child: Center(child: GestureDetector(onTap: (){
                                    controller.changeValueOfIndex(index);
                                  },child: PrimaryText("${controller.kitchenFacilities[index]}",fontSize: 12.sp,fontWeight: FontWeight.w400,))),
                                ), separatorBuilder: (context,index)=>SizedBox(width: 10.w,), itemCount: controller.kitchenFacilities.length),
                              ),

                            ],
                          ),
                        ),
                      ):
                      PrimaryContainerForStepOneInStepper(controller.value,Get.height,Get.width,(){
                        controller.changeValue();

                      },controller.iconData,"الوصف التفصيلي باللغة العربية","مثال: شاليه بتصميم عصري للباحثين عن الاستجمام\n والهدوء حيث المتعة وسعة المكان والراحة، يمتاز هذه \nالشاليه بإطلالة ساحرة على شاطئ البحر مع مسبح\n زجاجي ونوافير ومسطحات خضراء"),


//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.w,right: 20.w,top:10.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//
//                       PrimaryText("الاسعار",fontSize: 16.sp,fontWeight: FontWeight.w700,color: Color(0xFFD84E67),),
//               const Divider(color: Color(0xFFFC7C7C7),),
//                       PrimaryText("إختر أيام وسط الأسبوع",fontSize: 14.sp,fontWeight: FontWeight.w700,color: Color(0xFF335C87),),
// SizedBox(height: 10.h,),
// Container(height: 30.h,
//   child:   ListView.separated(scrollDirection: Axis.horizontal,shrinkWrap: true,itemBuilder: (context,index)=>GestureDetector(
//     onTap: (){
//       controller.days.add(controller.daysOfWeek[index]);
//       print(  controller.days.length);
//     },
//     child: Container(
//       child: Center(child: PrimaryText("${controller.daysOfWeek[index]}",fontSize: 10,fontWeight: FontWeight.w400,)),
//       width: 50.w,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
//           color:controller.days.contains(controller.daysOfWeek[index])?Color(0xFFF3C8D0): Color(0xFFFFFFFF),
//
//           boxShadow: [
//           BoxShadow(
//             color:  Color(0x286d6d6d),
//             offset:  Offset(2, 0),
//             blurRadius:  4,
//           ),
//         ]
//       ),
//     ),
//   ), separatorBuilder: (context,index)=>SizedBox(width: 5.w,), itemCount: controller.daysOfWeek.length),
// ),
//                       SizedBox(height: 10.h,),
//
//                       PrimaryText("سعر أيام وسط الأسبوع",fontSize: 14.sp,fontWeight: FontWeight.w700,color: Color(0xFF335C87),),
//                       SizedBox(height: 10.h,),
//
//                       PrimaryTextField(hintText: "/ليلة", controller: controller.pricePerNight, validator: (validator){}),
//                       const Divider(color: Color(0xFFFC7C7C7),),
//                       SizedBox(height: 10.h,),
//
//                       PrimaryText("إختر أيام نهاية الأسبوع",fontSize: 14.sp,fontWeight: FontWeight.w700,color: Color(0xFF335C87),),
//                       SizedBox(height: 10.h,),
//
//                       Container(height: 30.h,
//                         child:   ListView.separated(scrollDirection: Axis.horizontal,shrinkWrap: true,itemBuilder: (context,index)=>GestureDetector(
//                           onTap: (){
//                             controller.days.add(controller.daysOfWeek[index]);
//                             print(  controller.days.length);
//                           },
//                           child: Container(
//                             child: Center(child: PrimaryText("${controller.daysOfWeek[index]}",fontSize: 10,fontWeight: FontWeight.w400,)),
//                             width: 50.w,
//                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
//                                 color:controller.days.contains(controller.daysOfWeek[index])?Color(0xFFF3C8D0): Color(0xFFFFFFFF),
//
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color:  Color(0x286d6d6d),
//                                     offset:  Offset(2, 0),
//                                     blurRadius:  4,
//                                   ),
//                                 ]
//                             ),
//                           ),
//                         ), separatorBuilder: (context,index)=>SizedBox(width: 5.w,), itemCount: controller.daysOfWeek.length),
//                       ),
//                       SizedBox(height: 10.h,),
//
//                       PrimaryText("أسعار نهاية الأسبوع",fontSize: 14.sp,fontWeight: FontWeight.w700,color: Color(0xFF335C87),),
//                   Column(
//                     children: [
//                       Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20.r),
//                                     color: Color(0xFFFAFAFA),
//                                     border: Border.all(color: Color(0xFFEEF1F5))
//                                 ),child: Center(child: PrimaryText("120",color: Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
//                                 SizedBox(width: 30.w,),
//                                 Container(width: 100.w,child: PrimaryText("الخميس",color: Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,)),
//
//                               ],
//                             ),
//                       SizedBox(height: 10.h,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.r),
//                               color: Color(0xFFFAFAFA),
//                               border: Border.all(color: Color(0xFFEEF1F5))
//                           ),child: Center(child: PrimaryText("120",color: Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
//                           SizedBox(width: 30.w,),
//                           Container(width: 100.w,child: PrimaryText("الجمعة",color: Color(0xFF335C87),fontWeight: FontWeight.w700,fontSize: 12.sp,textAlign: TextAlign.right,)),
//
//                         ],
//                       )
//
//                     ],
//                   )
//                     ],
//                   ),
//                 )
                    ]

                );
              },
            ),
          ),
        ),

      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (context){
          return PrimaryBottomSheet(
            Get.width,
            80.h,
            25.r,
            "التالي",
            0xFFD84E67,
            0xFFFFFFFF,
            0x0a000000,
            function: () {
              controller.changeValueOfStepper(1);
            },
          );

        },
      ),

    );
  }
}
