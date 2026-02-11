import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/features/auth/presentation/widgets/create_acc_widgets/custom_profile_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/app_validator.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_drop_down_field.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../data/models/city_model.dart';
import '../../cubits/create_acc_cubit/create_acc_cubit.dart';

class CustomInputCreateAccWidget extends StatelessWidget {
  final CreateAccCubit cubit;

  const CustomInputCreateAccWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProfilePickerWidget(
            pickedImage: cubit.userImage,
            pickImage: () {
              cubit.pickImage();
            },
          ),
          heightSpace(15.h),
          Text(
            LocaleKeys.fullName.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blackTextEighthColor,
            ),
          ),
          heightSpace(8.h),
          CustomTextFormField(
            keyboardType: TextInputType.name,
            fillColor: AppColors.whiteColor,
            prefixIcon: SvgPicture.asset(
              AppAssets.user,
              fit: BoxFit.scaleDown,
              width: 20.w,
              height: 20.h,
              color: AppColors.blackTextEighthColor,
            ),
            ctrl: cubit.fullNameCtrl,
            validator: AppValidator.nameValidator,
            hintText: LocaleKeys.enterFullName.tr(),
          ),
          heightSpace(24.h),
          Text(
            LocaleKeys.city.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blackTextEighthColor,
            ),
          ),
          heightSpace(8.h),
          CustomDropDownField<CityModel>(
            value: cubit.selectedCity,
            hintText: LocaleKeys.city.tr(),
            fillColor: AppColors.whiteColor,
            prefixIcon: SvgPicture.asset(
              AppAssets.city,
              fit: BoxFit.scaleDown,
              width: 20.w,
              height: 20.h,
            ),
            validator: AppValidator.cityValidator,
            items: List.generate(cubit.cities.length, (index) {
              return DropdownMenuItem<CityModel>(
                value: cubit.cities[index],
                child: Text(cubit.cities[index].name),
              );
            }),
            onChanged: (CityModel? value) {
              cubit.selectCity(value!);
            },
          ),
        ],
      ),
    );
  }
}
