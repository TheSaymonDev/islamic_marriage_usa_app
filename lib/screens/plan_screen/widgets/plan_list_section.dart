import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';

class PlanListSection extends StatelessWidget {
  PlanListSection({super.key});

  final plans = [
    {
      "title": "Basic",
      "duration": "30 Day's Package",
      "price": "\$200",
      "oldPrice": "\$250",
      "connections": "2 connections included",
      "features": [
        "This is 30 Days Plan",
        "This is Basic plan",
        "\$200 Amount",
        "30 Day's Package",
        "Email Support",
      ]
    },
    {
      "title": "Standard",
      "duration": "90 Day's Package",
      "price": "\$450",
      "oldPrice": "\$550",
      "connections": "5 connections included",
      "features": [
        "This is 90 Days Plan",
        "This is Standard plan",
        "\$450 Amount",
        "90 Day's Package",
        "Priority Support",
      ]
    },
    {
      "title": "Premium",
      "duration": "180 Day's Package",
      "price": "\$800",
      "oldPrice": "\$900",
      "connections": "10 connections included",
      "features": [
        "This is 180 Days Plan",
        "This is Premium plan",
        "\$800 Amount",
        "180 Day's Package",
        "24/7 VIP Support",
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
        return Card(
          child: Container(
            width: 250.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: index == 1
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
                      Text(plan["title"]! as String,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white)),
                      Gap(8.h),
                      Text(plan["duration"]! as String,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white)),
                      Gap(8.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(plan["price"]! as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white)),
                          Gap(16.w),
                          Text(plan["oldPrice"]! as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough)),
                        ],
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
                            physics: NeverScrollableScrollPhysics(),
                            children: (plan["features"]! as List<String>)
                                .map(
                                  (f) => Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4.h),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check_circle,
                                            size: 20.sp,
                                            color: AppColors.primaryClr),
                                        Gap(8.w),
                                        Expanded(
                                          child: Text(
                                            f,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        CustomElevatedBtn(onPressed: () {}, name: 'Subscribe')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Gap(8.w),
    );
  }
}
