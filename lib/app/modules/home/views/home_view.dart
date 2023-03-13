import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/data/home_model.dart';
import 'package:project_architecture/app/modules/home/controllers/policy_and_privacy_page_controllers.dart';
import 'package:project_architecture/app/modules/home/views/search_result_view.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_divider.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("the list is$myList");
    List<MyMarker>? marker;
    marker = Get.arguments ??
        [
          MyMarker(
              {const Marker(markerId: MarkerId("1"), position: LatLng(0, 0))},
              "",
              "")
        ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
              child: PrimaryText(
            "(تصنيف ${countOfList+1} من ${myList!.length}) ${myList![countOfList]['Category']}",
            color: const Color(0XFF335C87),
            fontSize: 16.sp,
          )),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0XFF335C87),
            ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: GetBuilder<HomeController>(
            builder: (context) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GetBuilder<HomeController>(
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: 20.w, left: 20.w, top: 20.h),
                          child: SizedBox(
                              height: 50,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => CircleAvatar(
                                        backgroundColor:
                                            controller.step[index].value == true
                                                ? const Color(0xFFD84E67)
                                                : const Color(0xFFF1F1F1),
                                        child: PrimaryText(
                                          "${controller.step[index].number}",
                                          fontSize: 14.sp,
                                          color: controller.step[index].value ==
                                                  true
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFF707070),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                  separatorBuilder: (context, index) => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 2.h,
                                            width: Get.width / 3.3,
                                            color: controller.step[index]
                                                        .valueOfDiveder ==
                                                    false
                                                ? const Color(0xffFAFAFA)
                                                : const Color(0xFFD84E67),
                                          ),
                                        ],
                                      ),
                                  itemCount: 3)),
                        );
                      },
                    ),

                    controller.step[1].value == true
                        ? Visibility(
                            visible: controller.isVisible,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    PrimaryText(
                                      "تفاصيل الوحدة",
                                      color: const Color(0XFFD84E67),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const PrimaryDivider(0xfffc7c7c7),

                                    PrimaryText(
                                      "مساحة الوحدة",
                                      color: const Color(0xFF335C87),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
//
                                    PrimaryTextField(
                                      hintText: " ادخال اسم التصينف",
                                      controller: controller.textForm1,
                                      validator: (String? value) {
                                        return null;
                                      },
                                    ),

                                    PrimaryText(
                                      "الإتجاه",
                                      color: const Color(0xFF335C87),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),

                                    Container(
                                      width: Get.width,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          color: const Color(0xFFFAFAFA),
                                          border: Border.all(
                                              color: const Color(0xFFEEF1F5))),
                                      child: DropdownButton(
                                          hint: const Text("الشمال"),
                                          icon: const Icon(Icons
                                              .arrow_drop_down_circle_outlined),
                                          underline: const SizedBox(),
                                          elevation: 0,
                                          value: controller.myValue,
                                          items: controller.listDirectione
                                              .map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text("$e"),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            controller
                                                .changeValueOfDrowdwonButtom(
                                                    value);
                                          }),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    PrimaryText(
                                      "شباب أو عائلات",
                                      color: const Color(0xFF335C87),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    SizedBox(
                                      height: 35.h,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: controller.index ==
                                                            index
                                                        ? const Color(
                                                            0xFFF3C8D0)
                                                        : const Color(
                                                            0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x286d6d6d),
                                                        offset: Offset(2, 0),
                                                        blurRadius: 4,
                                                      ),
                                                    ]),
                                                width: 80.w,
                                                child: Center(
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .changeValueOfIndex(
                                                                  index);
                                                        },
                                                        child: PrimaryText(
                                                          "${controller.item[index]}",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                          itemCount: controller.item.length),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    PrimaryText(
                                      "يوصى بإختيار شباب وعائلات لزيادة فرصة حجز عقارك",
                                      color: const Color(0xFF9F9F9F),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    const Divider(
                                      color: Color(0xfffc7c7c7),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PrimaryImage(
                                          "assets/images/mins_with_background.png",
                                          funtion: () {
                                            controller.decreaseTheNumber();
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          width: 70.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: const Color(0xFFFAFAFA),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFEEF1F5))),
                                          child: Center(
                                              child: PrimaryText(
                                            "${controller.count.value}",
                                            color: const Color(0xFF757A86),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        PrimaryImage(
                                          "assets/images/add_with_background.png",
                                          funtion: () {
                                            controller.increaseTheNumber();
                                          },
                                        ),
                                        const Spacer(),
                                        PrimaryText(
                                          "عدد المجالس/الجلسات",
                                          color: const Color(0xFF335C87),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    PrimaryText(
                                      "نوع المجلس/الجلسة",
                                      color: const Color(0xFF335C87),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    SizedBox(
                                      height: 35.h,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x286d6d6d),
                                                        offset: Offset(2, 0),
                                                        blurRadius: 4,
                                                      ),
                                                    ]),
                                                width: 80.w,
                                                child: Center(
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .changeValueOfIndex(
                                                                  index);
                                                        },
                                                        child: PrimaryText(
                                                          "${controller.typeOfBoard[index]}",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                          itemCount:
                                              controller.typeOfBoard.length),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        PrimaryText(
                                          "خاص أو مشترك",
                                          color: const Color(0xFF335C87),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.right,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myChoose ==
                                                                true
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "مشترك",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myChoose ==
                                                                false
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "خاص",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        PrimaryText(
                                          "داخلي أو خارجي",
                                          color: const Color(0xFF335C87),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.right,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyTwoChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myTwoChoose ==
                                                                true
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "داخلي",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyTwoChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myTwoChoose ==
                                                                false
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "خارجي",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: SizedBox(
                                                width: 70,
                                                child: PrimaryTextField(
                                                  hintText: '0',
                                                  controller:
                                                      controller.numberOfSeats,
                                                  validator: (String? value) {
                                                    return null;
                                                  },
                                                ))),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.h),
                                          child: PrimaryText(
                                            "عدد المقاعد/يتسع لـ",
                                            color: const Color(0xFF335C87),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12.sp,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    PrimaryText(
                                      "مرافق المجلس/الجلسة",
                                      color: const Color(0xFF335C87),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    SizedBox(
                                      width: Get.width,
                                      child: Wrap(
                                        alignment: WrapAlignment.end,
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            controller.councilFacilities.length,
                                            (index) => Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5.w,
                                                      top: 5.h,
                                                      right: 0.w),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x286d6d6d),
                                                            offset:
                                                                Offset(2, 0),
                                                            blurRadius: 4,
                                                          ),
                                                        ]),
                                                    width: 60.w,
                                                    height: 30.h,
                                                    child: Center(
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .changeValueOfIndex(
                                                                      index);
                                                            },
                                                            child: PrimaryText(
                                                              "${controller.councilFacilities[index]}",
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                  ),
                                                )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    const Divider(
                                      color: Color(0xfffc7c7c7),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PrimaryImage(
                                          "assets/images/mins_with_background.png",
                                          funtion: () {
                                            controller
                                                .decreaseTheNumberOfRooms();
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          width: 70.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: const Color(0xFFFAFAFA),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFEEF1F5))),
                                          child: Center(
                                              child: PrimaryText(
                                            "${controller.numberOfRooms.value}",
                                            color: const Color(0xFF757A86),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        PrimaryImage(
                                          "assets/images/add_with_background.png",
                                          funtion: () {
                                            controller
                                                .increaseTheNumberOfRooms();
                                          },
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        PrimaryText(
                                          "عدد غرف النوم",
                                          color: const Color(0xFF335C87),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          controller.deleteRoom(
                                                              index);
                                                        },
                                                        child:
                                                            const PrimaryText(
                                                          "حذف الغرفة",
                                                          color:
                                                              Color(0xFFD84E67),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        )),
                                                    const Spacer(),
                                                    PrimaryText(
                                                      "${controller.dataOfRoom[index]['NumberOfRooms']}غرفة رقم ",
                                                      color: const Color(
                                                          0xFFD84E67),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                        child: SizedBox(
                                                            width: 60.w,
                                                            height: 60.h,
                                                            child:
                                                                PrimaryTextField(
                                                              hintText: '0',
                                                              validator:
                                                                  (String?
                                                                      value) {
                                                                return null;
                                                              },
                                                              controller: controller
                                                                          .dataOfRoom[
                                                                      index][
                                                                  'Number_of_double_beds'],
                                                            ))),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.h),
                                                      child: SizedBox(
                                                          width: 100.w,
                                                          child: PrimaryText(
                                                            "عدد الأسرة المزدوجة",
                                                            color: const Color(
                                                                0xFF335C87),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 12.sp,
                                                            textAlign:
                                                                TextAlign.right,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                        child: SizedBox(
                                                            width: 60.w,
                                                            height: 60.h,
                                                            child:
                                                                PrimaryTextField(
                                                              hintText: '0',
                                                              validator:
                                                                  (String?
                                                                      value) {
                                                                return null;
                                                              },
                                                              controller: controller
                                                                          .dataOfRoom[
                                                                      index][
                                                                  'number_of_single_beds'],
                                                            ))),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.h),
                                                      child: SizedBox(
                                                          width: 100.w,
                                                          child: PrimaryText(
                                                            "عدد الأسرة الفردية",
                                                            color: const Color(
                                                                0xFF335C87),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 12.sp,
                                                            textAlign:
                                                                TextAlign.right,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                        child: SizedBox(
                                                            width: 60.w,
                                                            height: 60.h,
                                                            child:
                                                                PrimaryTextField(
                                                              hintText: '0',
                                                              validator:
                                                                  (String?
                                                                      value) {
                                                                return null;
                                                              },
                                                              controller: controller
                                                                          .dataOfRoom[
                                                                      index][
                                                                  'number_of_sofa_beds'],
                                                            ))),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.h),
                                                      child: SizedBox(
                                                          width: 100.w,
                                                          child: PrimaryText(
                                                            "عدد أسرة الأريكة",
                                                            color: const Color(
                                                                0xFF335C87),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 12.sp,
                                                            textAlign:
                                                                TextAlign.right,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                PrimaryText(
                                                  "مرافق غرفة رقم 2",
                                                  color:
                                                      const Color(0xFF335C87),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.sp,
                                                  textAlign: TextAlign.right,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                SizedBox(
                                                  width: Get.width,
                                                  child: Wrap(
                                                    alignment:
                                                        WrapAlignment.end,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(
                                                        controller
                                                            .councilFacilities
                                                            .length,
                                                        (index) => Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5.w,
                                                                      top: 5.h,
                                                                      right:
                                                                          0.w),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xffffffff),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.r),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x286d6d6d),
                                                                        offset: Offset(
                                                                            2,
                                                                            0),
                                                                        blurRadius:
                                                                            4,
                                                                      ),
                                                                    ]),
                                                                width: 60.w,
                                                                height: 30.h,
                                                                child: Center(
                                                                    child: GestureDetector(
                                                                        onTap: () {
                                                                          controller
                                                                              .changeValueOfIndex(index);
                                                                        },
                                                                        child: PrimaryText(
                                                                          "${controller.councilFacilities[index]}",
                                                                          fontSize:
                                                                              10.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ))),
                                                              ),
                                                            )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                        itemCount:
                                            controller.numberOfRooms.value),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        PrimaryText(
                                          "هل يتوفر مطبخ؟",
                                          color: const Color(0xFF335C87),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.right,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyThreeChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myThreeChoose ==
                                                                true
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "لا",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyThreeChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myThreeChoose ==
                                                                false
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "نعم",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        PrimaryText(
                                          "خاص أو مشترك",
                                          color: const Color(0xFF335C87),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.right,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyFourChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myFourChoose ==
                                                                true
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "مشترك",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .changeValueOfMyFourChoose();
                                                },
                                                child: Container(
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                        color: controller
                                                                    .myFourChoose ==
                                                                false
                                                            ? const Color(
                                                                0XffD84E67)
                                                            : Colors.white),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x14000000),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "خاص",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF333333),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    PrimaryText(
                                      "طاولة طعام تسع إلى",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF335C87),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    PrimaryTextField(
                                        hintText: "2",
                                        controller: controller.dinningTable,
                                        validator: (value) {
                                          return null;
                                        }),
                                    PrimaryText(
                                      "مرافق المطبخ",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF335C87),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    SizedBox(
                                      height: 35.h,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x286d6d6d),
                                                        offset: Offset(2, 0),
                                                        blurRadius: 4,
                                                      ),
                                                    ]),
                                                width: 80.w,
                                                child: Center(
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .changeValueOfIndex(
                                                                  index);
                                                        },
                                                        child: PrimaryText(
                                                          "${controller.kitchenFacilities[index]}",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                          itemCount: controller
                                              .kitchenFacilities.length),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PrimaryText(
                                  "موقع العقار",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFD84E67),
                                ),
                                const PrimaryDivider(0xFFC7C7C7),
                                PrimaryText(
                                  "يرجى تحديد موقع العقار على الخريطة",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF707070),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: Colors.white,
                                  ),
                                  width: Get.width,
                                  height: 200.h,
                                  child: Stack(
                                    children: [
                                      GoogleMap(
                                        initialCameraPosition:
                                            controller.googlePlex,
                                        markers: marker?[0].marker ?? {},
                                        zoomControlsEnabled: false,
                                        onMapCreated:
                                            (GoogleMapController controllers) {
                                          controller.googleMapController
                                              .complete(controllers);
                                        },
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Get.offAllNamed(
                                                "/SearchResultPage");
                                          },
                                          child: Container(
                                            width: Get.width,
                                            height: 200,
                                            color: Colors.white.withOpacity(0),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                PrimaryText(
                                  "الموقع الذي تم إختياره",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF335C87),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                marker?[0].country == ""
                                    ? Container()
                                    : PrimaryText(
                                        "${marker?[0].street}/${marker?[0].country}",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF525A64),
                                      ),
                                const PrimaryDivider(0xFFC7C7C7),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterSwitch(
                                        width: 40.0.w,
                                        height: 25.0.h,
                                        valueFontSize: 0.0,
                                        toggleSize: 20.0,
                                        value: controller.switchValue,
                                        borderRadius: 30.0,
                                        padding: 1.0,
                                        activeColor: Colors.blue,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          controller.changeValueOfSwitchValue();
                                        }),
                                    const Spacer(),
                                    PrimaryText(
                                      "إظهار الموقع الدقيق قبل الحجز",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF333333),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                PrimaryText(
                                  "يمكنك إختيار إظهار موقعك الدقيق على الخريطة للضيوف المحتملين \nحتى قبل الحجز في حال كان عقارك للإستخدام التجاري ولا يوجد لديك\n أي تحفظ على إظهار موقعك الدقيق. إذا لم ترغب بهذا الخيار سيتم\n إظهار الموقع التقريبي لعقارك للضيوف المحتملين على أن يتم إظهار\n الموقع الدقيق بعد تأكيد الحجز",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF707070),
                                ),
                              ],
                            ),
                          ),

                    // Padding(
                    //   padding:  EdgeInsets.only(right: 20.w,top: 40.h),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //     PrimaryText("الموقع",fontSize: 14.sp,fontWeight: FontWeight.w400,color: const Color(0xFF525A64),),
                    //        PrimaryText("مدينة ظهران الجنوبي, الرحيب الغربي",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF525A64),),
                    //     ],),
                    //       SizedBox(width: 20.w,),
                    //
                    //       const PrimaryImage("assets/images/map.png"),
                    //
                    //   ],),
                    // ),

                    controller.step[0].value == true
                        ? GetBuilder<HomeController>(
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 20.w, right: 20.w, top: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    PrimaryText(
                                      "الاسعار",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFFD84E67),
                                    ),
                                    const Divider(
                                      color: Color(0xfffc7c7c7),
                                    ),
                                    PrimaryText(
                                      "إختر أيام وسط الأسبوع",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF335C87),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .addToListDays(index);
                                                },
                                                child: Container(
                                                  width: 50.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      color: controller.days
                                                              .contains(controller
                                                                      .daysOfWeek[
                                                                  index])
                                                          ? const Color(
                                                              0xFFF3C8D0)
                                                          : const Color(
                                                              0xFFFFFFFF),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x286d6d6d),
                                                          offset: Offset(2, 0),
                                                          blurRadius: 4,
                                                        ),
                                                      ]),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "${controller.daysOfWeek[index]}",
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                                ),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                          itemCount:
                                              controller.daysOfWeek.length),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    PrimaryText(
                                      "سعر أيام وسط الأسبوع",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF335C87),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    PrimaryTextField(
                                        hintText: "/ليلة",
                                        controller: controller.pricePerNight,
                                        validator: (validator) {
                                          return null;
                                        }),
                                    const Divider(
                                      color: Color(0xfffc7c7c7),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    PrimaryText(
                                      "إختر أيام نهاية الأسبوع",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF335C87),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .addToListweekend(index);
                                                },
                                                child: Container(
                                                  width: 50.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      color: controller.weekend
                                                              .contains(controller
                                                                      .daysOfWeek[
                                                                  index])
                                                          ? const Color(
                                                              0xFFF3C8D0)
                                                          : const Color(
                                                              0xFFFFFFFF),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x286d6d6d),
                                                          offset: Offset(2, 0),
                                                          blurRadius: 4,
                                                        ),
                                                      ]),
                                                  child: Center(
                                                      child: PrimaryText(
                                                    "${controller.daysOfWeek[index]}",
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                                ),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                          itemCount:
                                              controller.daysOfWeek.length),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    PrimaryText(
                                      "أسعار نهاية الأسبوع",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF335C87),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 70.w,
                                              height: 40.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  color:
                                                      const Color(0xFFFAFAFA),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFEEF1F5))),
                                              child: Center(
                                                  child: PrimaryText(
                                                "120",
                                                color: const Color(0xFF757A86),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                            ),
                                            SizedBox(
                                              width: 30.w,
                                            ),
                                            SizedBox(
                                                width: 100.w,
                                                child: PrimaryText(
                                                  "الخميس",
                                                  color:
                                                      const Color(0xFF335C87),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.sp,
                                                  textAlign: TextAlign.right,
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 70.w,
                                              height: 40.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  color:
                                                      const Color(0xFFFAFAFA),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFEEF1F5))),
                                              child: Center(
                                                  child: PrimaryText(
                                                "120",
                                                color: const Color(0xFF757A86),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                            ),
                                            SizedBox(
                                              width: 30.w,
                                            ),
                                            SizedBox(
                                                width: 100.w,
                                                child: PrimaryText(
                                                  "الجمعة",
                                                  color:
                                                      const Color(0xFF335C87),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.sp,
                                                  textAlign: TextAlign.right,
                                                )),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : Container(),
                  ]);
            },
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (context) {
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
              if (controller.days.isNotEmpty || controller.weekend.isNotEmpty) {
                controller.homeModel.add(HomeModel(
                    layer: myList![countOfList]['Category'],
                    location: marker?[0].country,
                    unitArea: controller.textForm1.text,
                    direction: controller.myValue,
                    youngPeopleOrFamilies: controller.item[controller.index],
                    numberOfCouncilsSessions: controller.count.value,
                    numberOfSeatsAccommodates: controller.numberOfSeats.text,
                    privateOrShared: controller.myChoose,
                    internalOrExternal: controller.myTwoChoose,
                    kitchenaVailable: controller.myThreeChoose,
                    privateOrShared2: controller.myFourChoose,
                    numberOfBedRooms: controller.numberOfRooms,
                    listOfBedRooms: [controller.dataOfRoom],
                    diningTableSleeps: controller.dinningTable.text,
                    weekdays: controller.days,
                    daysOfTheWeek: controller.weekend));
                controller.changeValueOfcountOfList();
                Get.offAllNamed('CategoryAddPageSuccessfully',
                    arguments: controller.homeModel);
              }
            },
          );
        },
      ),
    );
  }
}
