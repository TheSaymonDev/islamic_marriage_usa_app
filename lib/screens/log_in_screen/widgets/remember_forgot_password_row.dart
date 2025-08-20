import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/controllers/log_in_controller.dart';

class RememberForgotPasswordRow extends StatelessWidget {
  const RememberForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GetBuilder<LogInController>(builder: (controller) {
          return Checkbox(
              value: controller.isChecked,
              onChanged: (newValue) => controller.toggleIsChecked(newValue!));
        }),
        Text('Remember me', style: Theme.of(context).textTheme.bodySmall),
        const Spacer(),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.emailVerificationScreen),
          child: Text(
            'Forgot Password?',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.secondaryClr),
          ),
        )
      ],
    );
  }
}
