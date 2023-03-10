import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_button.dart';

class PrimaryBottomSheet extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final String ?textName;
  final int? colorValueOfText;
  final int? colorValueOfContainer;
  final int? colorValueOfShadowContainer;
  final void Function()?function;

  const PrimaryBottomSheet(this.width, this.height,this.radius,this.textName,this.colorValueOfText,this.colorValueOfContainer,this.colorValueOfShadowContainer,{Key? key,this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(

        height:height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:  Radius.circular(radius!),topRight: Radius.circular(radius!)),
            color:   Color(colorValueOfContainer!),
            boxShadow:  [
              BoxShadow(
                color:  Color(colorValueOfShadowContainer!),
                offset:  const Offset(0, -2),
                blurRadius:  8,
              ),

            ]
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 13.h),
          child:  PrimaryButton(text: "$textName", color: Color(colorValueOfText!),),
        ),
      ),
    );
  }
}
//
//0xFFD84E67 text
//25
//80
//0xFFFFFFFF color cont
//0x0a000000 shadow