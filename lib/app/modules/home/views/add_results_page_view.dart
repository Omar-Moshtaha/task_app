import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/data/home_model.dart';
import 'package:project_architecture/app/modules/home/controllers/result_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_container_of%D9%80result.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class ResultPageView extends GetView<ResultController> {
  ResultPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <HomeModel>list=Get.arguments;
print(list[0].direction);
    return Scaffold(
appBar:
        AppBar(
          actions: [
            Center(child: PrimaryText("نتائج الإضافة",color: const Color(0XFF335C87),fontSize: 16.sp,)),
            Padding(
              padding:  EdgeInsets.only(right:10.w,left: 10.w),
              child: GestureDetector(onTap: (){},child: const Icon(Icons.arrow_forward_ios,color: Color(0XFF335C87),)),
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
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: [
                ListView.separated(physics: BouncingScrollPhysics(),shrinkWrap: true,itemBuilder: (context,index)=>PrimaryContainerOfResult(list[index].layer,controller.modelItem,index,valueOfColorTextAndIcon: 0xFF335C87,valueOfColorContainer: 0XFFFFFFFF,valueOfColorShadowOfContainer: 0x14000000,heightOfContainer: Get.height/2.6,widthOfContainer: Get.width,homeModel: list,)
                    , separatorBuilder: (context,index)=>const SizedBox(), itemCount: list.length),

              ]

          ),
        )

    );
  }
}
