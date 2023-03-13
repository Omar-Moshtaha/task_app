

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_architecture/app/data/home_model.dart';
import 'package:project_architecture/app/data/result_model.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
class PrimaryContainerOfResult extends StatelessWidget {
  final double? widthOfContainer;
  final double? heightOfContainer;
  final int?index;
  final String? textNameOfContainer;
  final int ?valueOfColorContainer;
  final int? valueOfColorShadowOfContainer;
  final int ?valueOfColorTextAndIcon;
  final List<ResultModel>? resultModel;
  final List<HomeModel>?homeModel;
  const PrimaryContainerOfResult(this.textNameOfContainer,this.resultModel,this.index,{Key? key, this.widthOfContainer, this.heightOfContainer,this.valueOfColorContainer,this.valueOfColorShadowOfContainer, this.valueOfColorTextAndIcon, this.homeModel})
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
            SizedBox(height: 10.h,),

            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 50.w,child: PrimaryText("${homeModel![index!].direction}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),)),
                  SizedBox(width: 10.w,),
                  const PrimaryImage("assets/images/signpost.png",fit: BoxFit.cover,),
                  const Spacer(),

                  Container(width: 100.w,child: PrimaryText("${homeModel![index!].location}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF707070),)),
                  SizedBox(width: 10.w,),

                  const PrimaryImage("assets/images/location.png",fit: BoxFit.cover,),

                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 50.w,child: PrimaryText("${homeModel![index!].unitArea}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),)),
                SizedBox(width: 10.w,),
                const PrimaryImage("assets/images/ruler.png",fit: BoxFit.cover,),
                const Spacer(),

                Container(width: 100.w,child: PrimaryText("${homeModel![index!].layer}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF707070),)),
                SizedBox(width: 10.w,),

                const PrimaryImage("assets/images/layer.png",fit: BoxFit.cover,),

              ],
            ),
            SizedBox(height: 5.h,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(width: 50.w,child: PrimaryText("${homeModel![index!].numberOfCouncilsSessions}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),)),
                SizedBox(width: 10.w,),
                const PrimaryImage("assets/images/house-2.png",fit: BoxFit.cover,),
                const Spacer(),

                Container(width: 100.w,child: PrimaryText("${homeModel![index!].youngPeopleOrFamilies}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF707070),)),
                SizedBox(width: 10.w,),
                const PrimaryImage("assets/images/Group.png",fit: BoxFit.cover,),

              ],
            ),
            SizedBox(height: 5.h,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 50.w,child: PrimaryText("${homeModel![index!].numberOfBedRooms}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),)),
                SizedBox(width: 10.w,),
                const PrimaryImage("assets/images/Bed.png",fit: BoxFit.cover,),
                const Spacer(),

                Container(width: 100.w,child: PrimaryText("${homeModel![index!].numberOfCouncilsSessions}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF707070),)),
                SizedBox(width: 10.w,),

                const PrimaryImage("assets/images/chair.png",fit: BoxFit.cover,),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(width: 100.w,child: PrimaryText("${homeModel![index!].diningTableSleeps}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0XFF707070),)),
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
