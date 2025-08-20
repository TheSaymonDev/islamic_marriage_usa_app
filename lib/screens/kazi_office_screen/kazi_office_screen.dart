import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/kazi_office_screen/models/kazi_office_model.dart';

class KaziOfficeScreen extends StatefulWidget {
  const KaziOfficeScreen({super.key});

  @override
  State<KaziOfficeScreen> createState() => _KaziOfficeScreenState();
}

class _KaziOfficeScreenState extends State<KaziOfficeScreen> {
  final _kaziOfficeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Gap(16.h),
          SizedBox(
            height: 55.h,
            child: Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                        hintText: 'Search', controller: _kaziOfficeController)),
                Gap(8.w),
                CustomElevatedBtn(
                  onPressed: () {},
                  name: 'Find',
                  width: 146.w,
                )
              ],
            ),
          ),
          Gap(16.h),
          Flexible(
            child: MasonryGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 4.w,
              itemBuilder: (context, index) {
                final kaziOffice = KaziOfficeModel.kaziOfficeList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      height: 290.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        children: [
                          Container(
                            height: 160.h,
                            width: double.infinity.w,
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                  image: AssetImage(kaziOffice.imgPath),
                                  fit: BoxFit.fill),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    kaziOffice.toggleFavourite();
                                  });
                                },
                                icon: Icon(
                                  kaziOffice.isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: 25.sp,
                                  color: Colors.red,
                                )),
                          ),
                          Gap(16.h),
                          Text(kaziOffice.name,
                              style: Theme.of(context).textTheme.titleMedium),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 12.sp,
                                color: AppColors.lightGreyClr,
                              ),
                              Gap(4.w),
                              Text(
                                kaziOffice.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColors.lightGreyClr),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: KaziOfficeModel.kaziOfficeList.length,
            ),
          ),
        ],
      ),
    );
  }
}
