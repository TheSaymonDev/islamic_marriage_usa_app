import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_expansion_tile.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          Gap(32.h),
          CustomExpansionTile(
            leading: false,
            title: 'How much does it cost to submit a Biodata?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "It does not cost any money to submit the bio-data. But if you want to communicate by choosing someone's bio-data, you have to pay a subscription fee.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'Is this app for everyone?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'This website is not for everyone. Only Muslims can submit the bio-data.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'What could be the reason for not approving the Biodata?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "If you are not a Muslim.\nIf you provide any false information.\nIf your contact information is not correct.\nIf you do not agree to our terms and conditions.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
