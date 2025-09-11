import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';

class PlanListSection extends StatelessWidget {
  PlanListSection({super.key});

  final plans = [
    {
      "title": "Free (Trial)",
      "duration": "7 Days Access",
      "price": "\$0",
      "connections": "3 biodata requests",
      "features": [
        "View all profiles",
        "3 biodata requests",
        "7 days picture access",
      ]
    },
    {
      "title": "Standard",
      "duration": "1 Month",
      "price": "\$19.99",
      "tag": "Most Popular",
      "connections": "5 biodata requests",
      "features": [
        "All profile pictures",
        "5 biodata requests",
        "Profile boost",
      ]
    },
    {
      "title": "Premium",
      "duration": "2 Months",
      "price": "\$29.99",
      "connections": "10 biodata requests",
      "features": [
        "All profile pictures",
        "10 biodata requests",
        "Verified badge",
        "Priority listing",
      ]
    },
    {
      "title": "Super Premium",
      "duration": "3 Months",
      "price": "\$39.99",
      "connections": "15 biodata requests",
      "features": [
        "Priority support",
        "15 biodata requests",
        "Free profile promotion on homepage",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        final isPopular = plan["tag"] == "Most Popular";

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            width: 250.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isPopular
                    ? [AppColors.secondaryClr, AppColors.primaryClr]
                    : [AppColors.primaryClr, AppColors.secondaryClr],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            plan["title"]! as String,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                          if (isPopular)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text("Most Popular",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white)),
                            ),
                        ],
                      ),
                      Gap(6.h),
                      Text(
                        plan["duration"]! as String,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white70),
                      ),
                      Gap(10.h),
                      Text(
                        plan["price"]! as String,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // White body
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16.r)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Text(
                            plan["connections"]! as String,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.green),
                          ),
                        ),
                        Gap(8.h),
                        Expanded(
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: (plan["features"]! as List<String>)
                                .map(
                                  (f) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.check_circle,
                                            size: 18.sp,
                                            color: AppColors.primaryClr),
                                        Gap(8.w),
                                        Expanded(
                                          child: Text(
                                            f,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        CustomElevatedBtn(
                            onPressed: () {}, name: 'Subscribe Now')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Gap(12.w),
    );
  }
}
