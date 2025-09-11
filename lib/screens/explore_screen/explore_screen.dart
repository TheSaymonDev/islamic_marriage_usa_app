import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_outlined_btn.dart';
import 'package:islamic_marriage_usa_app/data/models/step1_general_info.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/controllers/all_biodata_controller.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/favourite_biodata_controller.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllBiodataController>(
      builder: (controller) {
        if (controller.isLoading) {
          return AppConstFunctions.customCircularProgressIndicator;
        }

        final biodatas = controller.allBiodata?.data?.biodatas ?? [];
        if (biodatas.isEmpty) {
          return Center(
            child: Text(
              'No biodata available',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            itemCount: biodatas.length,
            separatorBuilder: (_, __) => Gap(12.h),
            itemBuilder: (context, index) {
              final biodata = biodatas[index];
              final generalInfo = biodata.step1GeneralInfo;

              return CustomBioDataBg(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Gap(8.h),
                        CircleAvatar(
                          radius: 32.r,
                          backgroundImage: AssetImage(
                            generalInfo?.biodataType == "Female's Biodata"
                                ? AppUrls.femaleIcon
                                : AppUrls.maleIcon,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Gap(8.h),
                        Text(
                          biodata.bioDataId ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Gap(10.h),
                        if (generalInfo != null)
                          CustomBioDataTable(
                            data: generateGeneralInfo(generalInfo),
                          ),
                        Gap(10.h),
                        CustomOutlinedBtn(
                          onPressed: () => Get.toNamed(
                            AppRoutes.biodataDetailsScreen,
                            arguments: {'biodata': biodata},
                          ),
                          name: 'Full Bio Data',
                          width: 300.w,
                        ),
                        Gap(8.h),
                      ],
                    ),

                    /// 🔥 Favourite Button (Reactive)
                    GetBuilder<FavouriteBiodataController>(
                      builder: (favController) {
                        final isFav = biodata.sId != null &&
                            favController.isFavourite(biodata.sId!);

                        return Positioned(
                          top: 8,
                          right: 8,
                          child: InkWell(
                            onTap: () {
                              if (biodata.sId != null) {
                                favController.toggleFavourite(biodata.sId!);
                              }
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : Colors.white,
                                size: 22.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  /// Generate General Info Table Data
  Map<String, String?> generateGeneralInfo(Step1GeneralInfo data) {
    return {
      'Age': _calculateAge(data.dateOfBirth)?.toString(),
      'Height': data.height,
      'Complexion': data.complexion,
    };
  }

  /// Calculate Age from DOB
  int? _calculateAge(String? dateOfBirth) {
    if (dateOfBirth == null || dateOfBirth.isEmpty) return null;
    try {
      final datePart = dateOfBirth.split(" ").first; // yyyy-MM-dd
      final dob = DateTime.parse(datePart);

      final today = DateTime.now();
      int age = today.year - dob.year;

      if (today.month < dob.month ||
          (today.month == dob.month && today.day < dob.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return null;
    }
  }
}
