import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';

class ConnectionSection extends StatelessWidget {
  const ConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightCardClr,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryClr,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white12),
                      child: Icon(
                        Icons.private_connectivity_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Available Connections",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Your current balance",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      "No active connections",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.redClr),
                    ),
                  ),
                  Text(
                    "Ready to start connecting? Purchase a plan to unlock access to contact details.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomElevatedBtn(
                      onPressed: () {},
                      name: 'Learn How It Works',
                      height: 40.h,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
