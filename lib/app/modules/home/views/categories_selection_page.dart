import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/modules/home/controllers/categories_selection_controller.dart';
import 'package:project_architecture/app/modules/home/controllers/categories_selection_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

class CategoriesSelectionPage extends GetView<CategoriesSelectionController> {
  CategoriesSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
              child: PrimaryText(
            "إختر التصنيفات المتوفرة في عقارك",
            color: const Color(0XFF335C87),
            fontSize: 16.sp,
          )),
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
      body: GetBuilder<CategoriesSelectionController>(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Container(
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PrimaryText(
                      "إختر التصنيفات المتوفرة في عقارك من القائمة أو قم بإضافة تصنيفات خاصة بك",
                      color: const Color(0xFF9F9F9F),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      width: Get.width,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: const Color(0xFFFAFAFA),
                          border: Border.all(color: const Color(0xFFEEF1F5))),
                      child: DropdownButton(
                          hint: const Text("ستاندرد"),
                          icon:
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                          underline: const SizedBox(),
                          elevation: 0,
                          value: controller.categorySelected,
                          items: controller.categories.map((e) {
                            return DropdownMenuItem(
                              alignment: Alignment.centerRight,
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.changeValueOfCategorySelected(value);
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    PrimaryText(
                      "التصنيفات المختارة",
                      color: const Color(0xFF335C87),
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.tasnifati.length != 0
                        ? SizedBox(
                            height: 40.h,
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: const Color(0xffFFFFFF),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x286d6d6d),
                                                offset: Offset(2, 0),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                              child: PrimaryText(
                                            "${controller.tasnifati[index]['categorySelected']}",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          )),
                                        ),
                                        Positioned(
                                            bottom: 15,
                                            left: -10,
                                            child: PrimaryImage(
                                              "assets/images/dangerous.png",
                                              width: 30.w,
                                              height: 30.h,
                                              fit: BoxFit.cover,
                                              funtion: () {
                                                controller.deleteFromCategory(
                                                    controller
                                                        .tasnifati[index]);
                                              },
                                            )),
                                      ],
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10.w,
                                    ),
                                itemCount: controller.tasnifati.length),
                          )
                        : Container(),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.changeValueOfCustomRating();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PrimaryText(
                            "إضافة تصنيف مخصص",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF335C87),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          const PrimaryImage("assets/images/mins.png"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.addCustomRating == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const PrimaryDivider(0xFFFC7C7C7),
                              PrimaryText(
                                "إسم التصنيف باللغة العربية",
                                color: const Color(0xFF335C87),
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              PrimaryTextField(
                                hintText: "الرجاء ادخال اسم التصينف",
                                controller: controller.textForm1,
                                validator: (String? value) {},
                              ),
                              PrimaryText(
                                "إسم التصنيف باللغة الإنجليزية",
                                color: const Color(0xFF335C87),
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              PrimaryTextField(
                                hintText: "Please Enter Your Classification",
                                controller: controller.textForm2,
                                validator: (String? value) {},
                              ),
                              Container(
                                width: 80.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                        color: const Color(0xff335C87))),
                                child: Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.addMyCustomRating(
                                              controller.textForm1.text);
                                        },
                                        child: PrimaryText(
                                          "إضافة",
                                          color: const Color(0xff335C87),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ))),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        },
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
          Get.toNamed('UnitsInformationPage', arguments: controller.tasnifati);
        },
      ),
    );
  }
}
