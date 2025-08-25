import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.islamicmarriageusa.com/privacy/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(onPressed: () => Get.back(), title: 'Privacy Policy'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: WebViewWidget(controller: controller),
        )
    );
  }
}
