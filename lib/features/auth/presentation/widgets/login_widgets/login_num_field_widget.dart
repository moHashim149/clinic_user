import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/app_validator.dart';
import 'package:brandy_user/core/widgets/custom_text_form_field.dart';
import 'package:brandy_user/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/select_country_widget.dart';
import 'package:flutter/material.dart';

class LoginNumFieldWidget extends StatelessWidget {
  final SignInCubit cubit;
  const LoginNumFieldWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "رقم الجوال",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: "Cairo",
            ),
          ),
          const SizedBox(height: 8),
         CustomTextFormField(
          ctrl: cubit.phoneCtrl.controller,
          validator: (value) => AppValidator.phoneValidator(value),
          hintText: "**** *** 50",
          txtAlign: TextAlign.left,
          keyboardType: TextInputType.phone,
          textDirection: TextDirection.ltr,
          fillColor: Color(0xFFFAFFFE),
          hintStyle: AppTextStyles.textStyle12w500.copyWith(color: AppColors.darkGray),
           suffixIcon:SelectCountryWidget(cubit: cubit),
          ),
        ],
      ),
    );
  }
}