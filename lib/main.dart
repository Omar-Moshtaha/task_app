import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/API/network_helper/dio_helper.dart';
import 'package:project_architecture/core/cache_helper.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await CacheHelper.init();
  DioHelper.init();

  runApp(ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    designSize: const Size(375, 812),

    builder: (context, child) => GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFFFFFF),
          elevation: 0,
        )
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    ),
  ));
}
