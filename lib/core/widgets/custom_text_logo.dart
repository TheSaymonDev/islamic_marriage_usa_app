import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';

class CustomTextLogo extends StatelessWidget {
  const CustomTextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'Islamic ',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.primaryClr, fontSize: 35.sp),
            children: [
              TextSpan(
                text: 'Marriage',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.secondaryClr, fontSize: 35.sp),
              ),
            ],
          ),
        ),
        Image.asset(AppUrls.appLogoPng, width: 200.w,)
      ],
    );
  }
}
