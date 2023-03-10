import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';
import 'package:project_architecture/global_presntation/global_features/font_manager.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, required this.color})
      : super(key: key);
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 54.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.primary.withOpacity(0.26),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ], color: color, borderRadius: BorderRadius.circular(50.r)),
      child: Center(
        child: PrimaryText(
          text!,
          color: Colors.white,
          fontSize: 16,
          height: 1,
          fontWeight: FontWeightManager.bold,
        ),
      ),
    );
  }
}
