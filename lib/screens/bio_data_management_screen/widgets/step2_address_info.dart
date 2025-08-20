import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step2AddressInfo extends StatefulWidget {
  const Step2AddressInfo({super.key});

  @override
  State<Step2AddressInfo> createState() => _Step2AddressInfoState();
}

class _Step2AddressInfoState extends State<Step2AddressInfo> {
  final _byBornAddressController = TextEditingController();
  final _currentAddressController = TextEditingController();
  final _growUpAddressController = TextEditingController();
  final _settleAddressController = TextEditingController();

  bool _showOptionalFields = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // By Born Address (Required)
          TitleWithRequired(title: 'By Born Address', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter your birth address',
            controller: _byBornAddressController,
          ),

          // Optional Fields Checkbox
          Row(
            children: [
              Checkbox(
                value: _showOptionalFields,
                onChanged: (value) {
                  setState(() {
                    _showOptionalFields = value!;
                  });
                },
              ),
              Text(
                'Want to answer more?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          // Conditional Optional Fields
          if (_showOptionalFields) ...[
            // Current Address (Optional)
            TitleWithRequired(title: 'Current Address', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter your current address',
              controller: _currentAddressController,
            ),
            Gap(16.h),

            // Where did you grow up? (Optional)
            TitleWithRequired(title: 'Where did you grow up?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter where you grew up',
              controller: _growUpAddressController,
            ),
            Gap(16.h),

            // Where are you willing to settle? (Optional)
            TitleWithRequired(title: 'Where are you willing to settle?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter preferred settlement location',
              controller: _settleAddressController,
            ),
            Gap(16.h),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _byBornAddressController.dispose();
    _currentAddressController.dispose();
    _growUpAddressController.dispose();
    _settleAddressController.dispose();
    super.dispose();
  }
}