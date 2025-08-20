import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step7MarriageRelatedInfo extends StatefulWidget {
  const Step7MarriageRelatedInfo({super.key});

  @override
  State<Step7MarriageRelatedInfo> createState() => _Step7MarriageRelatedInfoState();
}

class _Step7MarriageRelatedInfoState extends State<Step7MarriageRelatedInfo> {
  final _marriageThoughtsController = TextEditingController();

  String? _guardiansAgreement;

  bool _showOptionalFields = false;

  final _agreementOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Guardians Agreement (Required)
          TitleWithRequired(title: 'Do your guardians agree to your marriage?', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _guardiansAgreement,
            items: _agreementOptions,
            onChanged: (value) {
              setState(() {
                _guardiansAgreement = value;
              });
            },
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
            // Marriage Thoughts
            TitleWithRequired(title: 'Why are you getting married? What are your thoughts on marriage?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Share your thoughts and reasons for marriage',
              controller: _marriageThoughtsController,
              maxLines: 5,
            ),
            Gap(16.h),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _marriageThoughtsController.dispose();
    super.dispose();
  }
}