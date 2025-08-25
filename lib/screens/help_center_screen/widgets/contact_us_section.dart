import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_list_tile_btn.dart';
import 'package:islamic_marriage_usa_app/screens/help_center_screen/controllers/contact_us_controller.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Gap(32.h),
          CustomListTileBtn(
            onTap: () =>
                Get.find<ContactUsController>().makePhoneCall('09647225782'),
            iconData: FontAwesomeIcons.phone,
            iconColor: Colors.green,
            title: 'Customer Service',
          ),
          Gap(16.h),
          CustomListTileBtn(
            onTap: () => Get.find<ContactUsController>()
                .launchInBrowser(Uri.parse('https://islamicmarriage.net')),
            iconData: FontAwesomeIcons.internetExplorer,
            iconColor: Colors.deepPurple,
            title: 'Website',
          ),
          Gap(16.h),
          CustomListTileBtn(
            onTap: () => Get.find<ContactUsController>().launchInBrowser(
                Uri.parse('https://www.facebook.com/islamicmarriage.net')),
            iconData: FontAwesomeIcons.facebook,
            iconColor: Color(0xFF1877F2),
            title: 'Facebook',
          ),
          Gap(16.h),
          CustomListTileBtn(
            onTap: () => Get.find<ContactUsController>()
                .launchInBrowser(Uri.parse('https://x.com/IMarriageBD')),
            iconData: FontAwesomeIcons.twitter,
            iconColor: Colors.black,
            title: 'Twitter',
          ),
          Gap(16.h),
          CustomListTileBtn(
            onTap: () => Get.find<ContactUsController>().launchInBrowser(
                Uri.parse('https://www.linkedin.com/company/islamicmarrige')),
            iconData: FontAwesomeIcons.linkedinIn,
            iconColor: Color(0xFF0A66C2),
            title: 'Linkedin',
          ),
        ],
      ),
    );
  }
}
