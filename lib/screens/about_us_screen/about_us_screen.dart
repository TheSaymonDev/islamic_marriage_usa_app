import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBarWithTitle(onPressed: () => Get.back(), title: 'About Us'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppUrls.appLogoPng,
              height: 170.h,
              width: 170.w,
            ),
            Text(
                "Islamic Marriage is a premier Islamic matrimonial site in Bangladesh, known for connecting Muslim singles seeking compatible life partners. With its focus on Islamic values and comprehensive profiles, it has become a trusted platform for finding meaningful relationships.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.darkGreyClr),
                textAlign: TextAlign.center),
            Gap(100.h),
            Text('Technology Solution Provider',
                style: Theme.of(context).textTheme.bodyMedium),
            Gap(4.h),
            Text('FinalTry Innovations',
                style: Theme.of(context).textTheme.titleMedium),
            Gap(24.h),
            Image.asset(
              AppUrls.companyLogo,
              height: 90.h,
              width: 90.w,
            ),
          ],
        ),
      ),
    );
  }
}
