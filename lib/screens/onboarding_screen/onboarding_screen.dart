import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/screens/onboarding_screen/controllers/slider_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder<SliderController>(
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (_, __, ___) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppUrls.appLogoPng,
                          height: 270.h,
                          width: 270.w,
                        ),
                        Expanded(
                          child: Text(
                            'onboardingMsg'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.primaryClr),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) =>
                          controller.changeSlide(index),
                      initialPage: 0,
                      height: 450.h,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: controller.currentIndex,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8.h,
                      dotWidth: 16.w,
                      activeDotColor: AppColors.primaryClr,
                    ),
                    onDotClicked: controller.changeSlide,
                  ),
                  Spacer(),
                  CustomElevatedBtn(
                    onPressed: () => Get.toNamed(AppRoutes.logInScreen),
                    name: 'Get Start',
                  ),
                  Gap(40.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
