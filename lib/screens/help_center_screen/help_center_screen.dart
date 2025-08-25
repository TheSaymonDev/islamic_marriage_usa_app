import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/help_center_screen/widgets/contact_us_section.dart';
import 'package:islamic_marriage_usa_app/screens/help_center_screen/widgets/faq_section.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              CupertinoIcons.arrow_left_circle_fill,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Help Center',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.titleMedium,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.darkGreyClr),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.primaryClr,
            indicatorWeight: 4.h,
            tabs: <Widget>[
              Tab(
                child: Center(
                  child: Text(
                    'FAQ',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    'CONTACT US',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FaqSection(),
            ContactUsSection(),
          ],
        ),
      ),
    );
  }
}
