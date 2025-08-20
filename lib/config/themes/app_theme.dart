import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightBgClr,
  useMaterial3: true,
  fontFamily: 'Onest',
    primaryColor: AppColors.primaryClr,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryClr,
        onPrimary: AppColors.darkFontClr,
        secondary: AppColors.lightCardClr,
        onSecondary: AppColors.lightFontClr,
        error: AppColors.redClr,
        onError: AppColors.lightBgClr,
        surface: AppColors.lightCardClr,
        onSurface: AppColors.lightFontClr),
  textTheme: TextTheme(
    bodyLarge:
        TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w400, height: 1.2.h,),
    bodyMedium:
        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, height: 1.2.h),
    bodySmall:
        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, height: 1.2.h),
    titleLarge:
        TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w700, height: 1.2.h),
    titleMedium:
        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, height: 1.2.h),
    titleSmall:
        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, height: 1.2.h),
  ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(fontSize: 18.sp, color: AppColors.darkGreyClr, fontFamily: 'Onest', fontWeight: FontWeight.w400),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primaryClr, width: 2.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primaryClr, width: 2.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primaryClr, width: 2.w),
      ),
    ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBgClr,
  fontFamily: 'Onest',
  useMaterial3: true,
  primaryColor: AppColors.primaryClr,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryClr,
      onPrimary: AppColors.darkFontClr,
      secondary: AppColors.darkCardClr,
      onSecondary: AppColors.darkFontClr,
      error: AppColors.redClr,
      onError: AppColors.lightBgClr,
      surface: AppColors.darkCardClr,
      onSurface: AppColors.darkFontClr),
  textTheme: TextTheme(
    bodyLarge:
    TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w400, height: 1.2.h,),
    bodyMedium:
    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, height: 1.2.h),
    bodySmall:
    TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, height: 1.2.h),
    titleLarge:
    TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w700, height: 1.2.h),
    titleMedium:
    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, height: 1.2.h),
    titleSmall:
    TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, height: 1.2.h),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.black,
    hintStyle: TextStyle(fontSize: 18.sp, color: AppColors.lightGreyClr, fontFamily: 'Onest', fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.primaryClr, width: 2.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.primaryClr, width: 2.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.primaryClr, width: 2.w),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkCardClr,
  ),
);
