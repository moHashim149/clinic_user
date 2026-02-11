import 'package:brandy_user/core/util/extensions/media_query.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/custom_header_login.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../data/arguments/create_acc_argument.dart';
import '../cubits/create_acc_cubit/create_acc_cubit.dart';
import '../widgets/create_acc_widgets/custom_input_create_acc_widget.dart';
import '../widgets/create_acc_widgets/custom_accept_terms_and_cond_widget.dart';

class CreateAccView extends StatelessWidget {
  final CreateAccArgument argument;

  const CreateAccView({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CreateAccCubit, CreateAccState>(
        builder: (context, state) {
          final cubit = context.read<CreateAccCubit>();
          return state is GetCitiesLoading
              ? const CustomLoading()
              : state is GetCitiesFailure
              ? CustomError(
                  error: state.error,
                  retry: () {
                    cubit.fetchCities();
                  },
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 40.h,
                  ),
                  child: AbsorbPointer(
                    absorbing: state is CreateAccLoading,
                    child: Column(
                      children: [
                        CustomAuthHeader(
                          title: LocaleKeys.createAccountTitle.tr(),
                          body: LocaleKeys.signInHeaderBody.tr(),
                        ),
                        heightSpace(16.h),
                        CustomInputCreateAccWidget(cubit: cubit),
                        heightSpace(24.h),
                        CustomAcceptTermsAndCondWidget(),
                        heightSpace(context.height * 0.18),
                        CustomButton(
                          onPressed: () {
                            bool? isFormValidated = cubit.formKey.currentState
                                ?.validate();

                            if (isFormValidated!) {
                              cubit.createAcc(
                                phone: argument.phone,
                                context: context,
                              );
                            }
                          },
                          isLoading: state is CreateAccLoading,
                          text: LocaleKeys.register.tr(),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
