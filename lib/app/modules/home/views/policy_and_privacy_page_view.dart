import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/controllers/policy_and_privacy_page_controllers.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class PolicyAndPrivacyPage extends GetView<policyAndPrivacyPageControllers> {
  const PolicyAndPrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addToListCategories(Get.arguments).then((value) {});

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryImage(
              "assets/images/dangerous.png",
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 2.h),
              child: Column(
                children: [
                  const PrimaryDivider(0xfffc7c7c7),
                  PrimaryText(
                    "في الخطوات التالية ستقوم بإضافة مواصفات التصنيف \nالأول فالتالي في ست خطوات لكل تصنيف. بإمكانك \nالتوقف و العودة لإستكمال إضافة العقار بالعودة إلى \nقائمة المسودة. علماً أنه سيتم نسخ مواصفات التصنيف\n الأول للتصنيفات المتبقية بشكل تلقائي عند الإنتهاء من\n إدخال التفاصيل في التصنيف الأول وذلك لتسهيل إدخال\n المواصفات المكررة",
                    textAlign: TextAlign.right,
                    maxLines: 7,
                    fontSize: 14.sp,
                    color: const Color(0xFF335C87),
                    height: 1.2.h,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PrimaryBottomSheet(
        Get.width,
        80.h,
        25.r,
        "التالي",
        0xFFD84E67,
        0xFFFFFFFF,
        0x0a000000,
        function: () {
          Get.offAllNamed(
            'home',
          );
        },
      ),
    );
  }
}
