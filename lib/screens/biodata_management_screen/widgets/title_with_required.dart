import 'package:flutter/material.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class TitleWithRequired extends StatelessWidget {
  final String title;
  final bool isRequired;
  const TitleWithRequired({super.key, required this.title, required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.titleSmall,
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.redClr),
            ),
          if (isRequired)
            TextSpan(
              text: ' (Required)',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.darkGreyClr),
            ),
        ],
      ),
    );
  }
}