import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BiodataStatusChip extends StatelessWidget {
  final String status;
  const BiodataStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    switch (status.toLowerCase()) {
      case 'approved':
        bgColor = Colors.green;
        break;
      case 'pending':
        bgColor = Colors.orange;
        break;
      default:
        bgColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        status.capitalize!,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: bgColor),
      ),
    );
  }
}