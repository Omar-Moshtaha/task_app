import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class PrimaryContainerForStepOneInStepper extends StatelessWidget {
  final bool? value;
  final double? heigth;
  final double ?width;
  final String ?titleOfContainer;
  final String ?titleBodyOfContainer;

  final IconData ?iconData;
final void Function()?funtion;
  const PrimaryContainerForStepOneInStepper(
      this.value,this.heigth,this.width,this.funtion,this.iconData,this.titleOfContainer,this.titleBodyOfContainer, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding:  EdgeInsets.only(top: 10.h,left: 20.w,right: 20.w),
          child: Container(width: width,height:value==true? heigth!/3.3:70.h,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: const Color(0xFFFFFFFF) ,
            boxShadow:  const [
              BoxShadow(
                color:  Color(0x14000000),
                offset:  Offset(0, 2),
                blurRadius:  4,
              ),
            ],
          ), child: Padding(
              padding:  EdgeInsets.only(left: 15.w,right: 15.w,top: 20.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    Row(
                      children: [
                        GestureDetector(onTap:funtion,child: Icon(iconData,color: Color(0XFF335C87),)),
                        Spacer(),
                        PrimaryText("$titleOfContainer",color: const Color(0XFF335C87),fontSize: 14.sp,fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    value ==true?Container(width: Get.width,height: 150.h,decoration: BoxDecoration(
                        color: Color(0xFFEEF1F5),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Color(0xFFFAFAFA))
                    ),child: Align(alignment: AlignmentDirectional.topEnd,child: Padding(
                      padding:  EdgeInsets.only(top: 20.h,right: 20.w),
                      child:   PrimaryText(titleBodyOfContainer!,fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xFF757A86),),
                    )),):Container(),



                  ]
              )
          )
          )
      );
  }
}

//