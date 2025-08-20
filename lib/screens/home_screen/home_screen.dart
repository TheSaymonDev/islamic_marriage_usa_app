import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/explore_screen.dart';
import 'package:islamic_marriage_usa_app/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:islamic_marriage_usa_app/screens/kazi_office_screen/kazi_office_screen.dart';
import 'package:islamic_marriage_usa_app/screens/plan_screen/plan_screen.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _widgetOptions = [
    ExploreScreen(),
    PlanScreen(),
    KaziOfficeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        appBar: _buildAppBar(controller.selectedIndex),
        body:
            SafeArea(child: _widgetOptions.elementAt(controller.selectedIndex)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.lightBgClr,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withValues(alpha: .2),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: GNav(
                rippleColor: AppColors.secondaryClr,
                hoverColor: Colors.grey[200]!,
                gap: 6.w,
                activeColor: AppColors.secondaryClr,
                iconSize: 22.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[200]!,
                color: AppColors.primaryClr,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.subscriptions,
                    text: 'Plan',
                  ),
                  GButton(
                    icon: Icons.apartment,
                    text: 'Kazi Office',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: controller.selectedIndex,
                onTabChange: controller.changeScreen,
              ),
            ),
          ),
        ),
      );
    });
  }

  PreferredSizeWidget _buildAppBar(int index) {
    switch (index) {
      case 1: // Plan
        return CustomAppBarWithTitle(
          onPressed: () {},
          title: "Subscription Plan",
        );

      case 2: // Kazi Office
        return CustomAppBarWithTitle(
          onPressed: () {},
          title: "Kazi Office",
        );

      case 3: // Profile
        return CustomAppBarWithTitle(
          onPressed: () {},
          title: "My Profile",
        );

      default: // Home
        return CustomAppBarWithTitle(
          onPressed: () {},
          title: "Explore All Bio Data",
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.tune,
                  color: AppColors.primaryClr,
                )),
            Gap(8.w),
          ],
        );
    }
  }
}
