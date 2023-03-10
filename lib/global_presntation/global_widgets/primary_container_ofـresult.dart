

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_architecture/app/data/result_model.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
class PrimaryContainerOfResult extends StatelessWidget {
  final double? widthOfContainer;
  final double? heightOfContainer;
  final String? textNameOfContainer;
  final int ?valueOfColorContainer;
  final int? valueOfColorShadowOfContainer;
  final int ?valueOfColorTextAndIcon;
  final List<ResultModel>? resultModel;
  const PrimaryContainerOfResult(this.textNameOfContainer,this.resultModel,{Key? key, this.widthOfContainer, this.heightOfContainer,this.valueOfColorContainer,this.valueOfColorShadowOfContainer, this.valueOfColorTextAndIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return                     Padding(
      padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
      child: Container(width: widthOfContainer,height: heightOfContainer,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color:  Color(valueOfColorContainer??0) ,
        boxShadow:   [
          BoxShadow(
            color:  Color(valueOfColorShadowOfContainer??0),
            offset:  const Offset(0, 2),
            blurRadius:  4,
          ),
        ],
      ), child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            PrimaryText("$textNameOfContainer",color:  Color(valueOfColorTextAndIcon??0),fontSize: 16.sp,fontWeight: FontWeight.w700,),
            const PrimaryDivider( 0xfffc7c7c7),
            PrimaryImage("assets/images/house.png",fit: BoxFit.cover,width: Get.width,),
            SizedBox(height: 5.h,),
            ListView.separated(physics: const NeverScrollableScrollPhysics(),padding: EdgeInsets.zero,shrinkWrap: true,scrollDirection: Axis.vertical,itemBuilder: (context,index)=>Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrimaryText("${resultModel![index].text_1}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),),
                SizedBox(width: 10.w,),
                Image.asset("${resultModel![index].image_2}",fit: BoxFit.cover,),
                const Spacer(),

                PrimaryText("${resultModel![index].text}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF707070),),
                SizedBox(width: 10.w,),

                Image.asset("${resultModel![index].image}",fit: BoxFit.cover,),

              ],
            ), separatorBuilder: (context,index)=>const SizedBox(), itemCount: resultModel!.length),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryText("تتسع إلى 2",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),),
                SizedBox(width: 10.w,),

                Image.asset("assets/images/kitchen.png"),

              ],
            ),

          ],
        ),
      )
      ),
    );
  }
}
