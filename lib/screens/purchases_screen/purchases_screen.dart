import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
          onPressed: () => Get.back(), title: 'My Purchases'),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.construction, // 🛠️
              color: Colors.orange,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              "Development in progress...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
