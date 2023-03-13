import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/data/home_model.dart';
import 'package:project_architecture/app/modules/home/controllers/category_add_page_successfully_controller.dart';
import 'package:project_architecture/app/modules/home/views/units_information_page_view.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
class CategoryAddPageSuccessfully extends GetView<CategoryAddPageSuccessfullyController> {

  @override
  Widget build(BuildContext context) {
    List<HomeModel> listItem = Get.arguments;

    print("The length is${listItem.length}");
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PrimaryImage(
                "assets/images/success_icon.png",
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10.h,),

              PrimaryText(
                "تم إضافة تفاصيل (تصنيف 1 من 1) ${listItem[0].layer} ",
                textAlign: TextAlign.right,
                fontSize: 18.sp,
                color: const Color(0xFF335C87),
                height: 1.2.h,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: PrimaryText(
                  "لقد قمت بإضافة تفاصيل التصنيف الأول بنجاح، بإمكانك الإستمرار ومتابعة إضافة تفاصيل التصنيف الثاني أو بإمكانك  الخروج الأن والعودة لاحقاً لمتابعة  إضافة عقارك عن طريق المسودة",
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  color: const Color(0xFF707070),
                  height: 1.2.h,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryBottomSheet(
        Get.width, 80.h, 25.r, "التالي", 0xFFD84E67, 0xFFFFFFFF, 0x0a000000,function: (){
          for(int i=0;i<list.length;i++){
            if(ListOfCategories.length==list.length){

              print(list.length);
              Get.offAllNamed('/ResultPageView',arguments: ListOfCategories);

            }else{
              controller.addToMyList(listItem[i]);
              Get.offAllNamed('/home');

            }

          }
      },),
    );
  }
}
