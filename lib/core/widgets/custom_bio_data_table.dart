import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';


class CustomBioDataTable extends StatelessWidget {
  final Map<dynamic, dynamic>? data;

  const CustomBioDataTable({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.primaryClr,
      ),
      child: Table(
        border: TableBorder.all(color: Colors.white, width: 2.w),
        children: data!.entries.map((entry) {
          return TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  child: Text(entry.key,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  child: Center(
                    child: Text(entry.value,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
