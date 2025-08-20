import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/screens/plan_screen/widgets/connection_section.dart';
import 'package:islamic_marriage_usa_app/screens/plan_screen/widgets/plan_list_section.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: ConnectionSection(),
          ),
          Gap(8.h),
          Expanded(
            flex: 10,
            child: PlanListSection(),
          ),
        ],
      ),
    );
  }
}
