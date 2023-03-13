import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/modules/home/controllers/search_result_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_bottom_sheet.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class SearchResultPage extends GetView<SearchResultController> {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchResultController>(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GetBuilder<SearchResultController>(
                builder: (context){
                  return Container(
                    width: Get.width,
                    height: Get.height / 1.3 / 0.97,
                    color: Colors.white,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      onTap: (latLng) {
                        controller.getGeocodingOfLatLng(
                            latLng.latitude, latLng.longitude);
                      },
                      initialCameraPosition: controller.googlePlex,
                      markers: controller.marker,
                      onMapCreated: (GoogleMapController controllers) {
                        controller.googleMapController.complete(controllers);
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GetBuilder<SearchResultController>(
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            PrimaryText(
                              "الموقع",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF525A64),
                            ),
                            controller.country == null
                                ? Container()
                                : PrimaryText(
                                    "${controller.street}/${controller.country}",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF525A64),
                                  ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const PrimaryImage("assets/images/map.png"),
                  ],
                ),
              ),

              // PrimaryContainerForStepOneInStepper(controller.value,Get.height,Get.width,(){
              //   controller.changeValue();
              //
              // },controller.iconData,"الوصف التفصيلي باللغة العربية","مثال: شاليه بتصميم عصري للباحثين عن الاستجمام\n والهدوء حيث المتعة وسعة المكان والراحة، يمتاز هذه \nالشاليه بإطلالة ساحرة على شاطئ البحر مع مسبح\n زجاجي ونوافير ومسطحات خضراء"),
              // Container(width: Get.width,height: Get.height/1.3/0.97,color: Colors.white,child:  GoogleMap(
              //   mapType: MapType.normal,
              //
              //   initialCameraPosition: controller.googlePlex,
              //   onMapCreated: (GoogleMapController controllers) {
              //     controller.googleMapController.complete(controllers);
              //   },
              // ),),
            ],
          );
        },
      ),
      bottomNavigationBar: GetBuilder<SearchResultController>(
        builder: (context){
          return PrimaryBottomSheet(
            Get.width,
            80.h,
            25.r,
            "حفظ",
            0xFFD84E67,
            0xFFFFFFFF,
            0x0a000000,
            function: () {
              Get.toNamed(
                "/home",
                arguments: controller.myMarker,
              );
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                controller.deleteMarker();

              });
            },
          );
        },
      ),
    );
  }
}

class MyMarker {
  Set<Marker> marker = {};
  String? country;
  String? street;

  MyMarker(this.marker, this.country, this.street);
}
