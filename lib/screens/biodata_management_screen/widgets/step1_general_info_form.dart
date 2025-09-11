import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step1_general_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step1GeneralInfoForm extends StatelessWidget {
  const Step1GeneralInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step1GeneralInfoController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Type of Biodata
              TitleWithRequired(title: 'Type of Biodata', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedBioDataType,
                items: controller.bioDataTypeOptions,
                onChanged: (value) => controller.updateSelectedBioDataType(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Marital Status
              TitleWithRequired(title: 'Marital Status', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedMaritalStatus,
                items: controller.maritalStatusOptions,
                onChanged: (value) =>
                    controller.updateSelectedMaritalStatus(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Date of Birth
              TitleWithRequired(title: 'Date of Birth', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Select Date',
                controller: controller.dateOfBirthController,
                readOnly: true,
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryClr,
                  size: 20.sp,
                ),
                onTap: () => _selectDate(controller, context),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Complexion
              TitleWithRequired(title: 'Complexion', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedComplexion,
                items: controller.complexionOptions,
                onChanged: (value) => controller.updateSelectedComplexion(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Height
              TitleWithRequired(title: 'Height', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedHeight,
                items: controller.heightOptions,
                onChanged: (value) => controller.updateSelectedHeight(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Weight
              TitleWithRequired(title: 'Weight', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedWeight,
                items: controller.weightOptions,
                onChanged: (value) => controller.updateSelectedWeight(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Blood Group
              TitleWithRequired(title: 'Blood Group', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedBloodGroup,
                items: controller.bloodGroupOptions,
                onChanged: (value) => controller.updateSelectedBloodGroup(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // State
              TitleWithRequired(title: 'State', isRequired: true),
              Gap(8.h),
              CustomDropdownBtn(
                value: controller.selectedState,
                items: controller.stateOptions,
                onChanged: (value) => controller.updateSelectedState(value),
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Postal Code
              TitleWithRequired(title: 'Postal Code', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter postal code',
                controller: controller.postalCodeController,
                validator: AppValidators.requiredValidator,
              ),
            ],
          ),
        );
      }),
    );
  }

  void _selectDate(
      Step1GeneralInfoController controller, BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      controller.selectedDob = selectedDate;
      controller.dateOfBirthController.text =
          DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }
}
