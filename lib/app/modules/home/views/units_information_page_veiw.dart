import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/controllers/units_information_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_container_unit_information.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
List list=[];
List unitInformationDetails=[];
class UnitsInformationPage extends GetView<UnitsInformationController> {
  UnitsInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    list= Get.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
              child: PrimaryText(
            " معلومات الوحدات",
            color: const Color(0XFF335C87),
            fontSize: 16.sp,
          )),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0XFF335C87),
                )),
          ),
        ],
        flexibleSpace: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r))),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PrimaryText(
                  "التصنيفات",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF335C87),
                ),
                PrimaryText(
                  "اختر عدد الوحدات وأرقامها في كل تصنيف",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9F9F9F),
                ),
                const PrimaryDivider(0xFFFC7C7C7),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        GetBuilder<UnitsInformationController>(
                            builder: (context) {
                          return PrimaryContaineUnitInformation(
                              Get.width,
                              "${list[index]['categorySelected']}",
                              Get.height,
                              list[index]['value'],
                              0xFFFFFFFF,
                              0x14000000, () {
                            controller.changeValue(list[index]['value'],index);
                          }, controller.iconData, controller.unitListModel,
                              list[index]['number'], () {
                           controller.supplyOverTheCounter(index);

                          }, (){
                            controller.diminishmentOfTheCounter(index);

                          },index);
                        }),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2.h,
                        ),
                    itemCount: list.length)
              ],
            ),
          ),
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
for(int i=0;i<list.length;i++){
  unitInformationDetails.add({
    "Category":list[i],
    "NumberUnit":"${list[i]['number']}",
    "UnitName":controller.unitListModel[i].text_1,
    "UnitTextForm":controller.unitListModel[i].textForm?.text,

  });

}
print(unitInformationDetails);

        },
      ),
    );
  }
}
