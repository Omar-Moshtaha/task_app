import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_architecture/app/data/unit_information_model.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_image.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';
class PrimaryContaineUnitInformation extends StatelessWidget {
  final double? widthOfContainer;
  final double? heightOfContainer;
  final bool ?value;
  final String ?textName;
  final int ?valueOfContainerColor;
  final int ?valueOfShadowContainerColor;
  final void Function()?funtion;
  final IconData? iconData;
  final int ?number;
  final List <UnitInformationModel>?unitListModel;
  final void Function()? minsFuntion;
  final void Function()? plusFuntion;

  final int ?index;
  const PrimaryContaineUnitInformation(this.widthOfContainer,this.textName, this.heightOfContainer,this.value,this.valueOfContainerColor,this.valueOfShadowContainerColor,this.funtion,this.iconData,this.unitListModel,this.number,this.plusFuntion,this.minsFuntion,this.index,{Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Container(width: widthOfContainer,height:value==true?  heightOfContainer!/2.9:60.h,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color:  Color(valueOfContainerColor!) ,
        boxShadow:   [
          BoxShadow(
            color:  Color(valueOfShadowContainerColor!),
            offset:  const Offset(0, 2),
            blurRadius:  4,
          ),
        ],
      ), child: Padding(
        padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            Row(
              children: [
                GestureDetector(onTap: funtion,child: Icon(iconData,color: const Color(0XFF335C87),)),
                const Spacer(),
                PrimaryText("$textName",color: const Color(0XFF335C87),fontSize: 16.sp,fontWeight: FontWeight.w700,),
              ],
            ),
            if (value==true) Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryImage("assets/images/mins.png",funtion: minsFuntion,),

                SizedBox(width: 10.w,),
                Container(width: 70.w,height: 40.h,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xFFFAFAFA),
                    border: Border.all(color: const Color(0xFFEEF1F5))
                ),child: Center(child: PrimaryText("$number",color: const Color(0xFF757A86),fontSize: 14.sp,fontWeight: FontWeight.w400,)),),
                SizedBox(width: 10.w,),
                PrimaryImage("assets/images/add.png",funtion: plusFuntion,),

                const Spacer(),

                PrimaryText("عدد الوحدات",color: const Color(0XFF335C87),fontSize: 12.sp,fontWeight: FontWeight.w700,),


              ],
            ) else Container(),
            SizedBox(height: 5.h,),

            value==true? const Divider(color: Color(0xfffc7c7c7),):Container(),

            SizedBox(height: 5.h,),
            value==true?   PrimaryText("أرقام الوحدات",fontSize: 12.sp,fontWeight: FontWeight.w700,color: const Color(0xFF335C87),):Container(),
            SizedBox(height: 5.h,),

            value==true?             Wrap(children: List.generate(

                unitListModel!.where((element) =>element.index==index).toList().length, (index) =>
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Wrap(
direction: Axis.horizontal,

              children: [
Container(width: 70.w,height: 70.h,child: PrimaryTextField(hintText: "0", controller:unitListModel![index].textForm , validator: (validator){})),
SizedBox(width: 20.w,),
                  Padding(padding: EdgeInsets.only(top: 8.h),child: PrimaryText("${unitListModel![index].text_1}",fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF335C87),)),



              ],
            ),
                ) ),):Container(),
          ],
        ),
      )
      ),


    );


  }
}
