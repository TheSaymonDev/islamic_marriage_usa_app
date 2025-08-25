import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_outlined_btn.dart';

class FavouriteBioDataScreen extends StatelessWidget {
  FavouriteBioDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
        onPressed: () => Get.back(),
        title: 'My Favourite Bio Data',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            itemBuilder: (context, index) => CustomBioDataBg(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Gap(8.h),
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(AppUrls.maleIcon),
                            backgroundColor: Colors.white,
                          ),
                          Gap(8.h),
                          Text(
                            'ID: User-5660',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                          Gap(10.h),
                          CustomBioDataTable(data: generateGeneralInfo),
                          Gap(10.h),
                          CustomOutlinedBtn(
                            onPressed: () =>
                                Get.toNamed(AppRoutes.bioDataDetailsScreen),
                            name: 'Full Bio Data',
                            width: 300.w,
                          ),
                          Gap(8.h),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            // এখানে favourite toggle logic লিখবা
                          },
                          borderRadius: BorderRadius.circular(20.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons
                                  .favorite_border, // Favourite হলে Icons.favorite দিবা
                              color: Colors.white,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => Gap(12.h),
            itemCount: 10),
      ),
    );
  }

  final generateGeneralInfo = {
    'Age': '25 Years',
    'Height': "5' 3\"",
    'Complexion': 'Light Brown',
  };
}
