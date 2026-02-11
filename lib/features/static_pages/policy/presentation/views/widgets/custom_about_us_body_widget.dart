import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../../../core/widgets/custom_error.dart';
import '../../../../../../../core/widgets/custom_loading.dart';
import '../../cubit/policy_cubit.dart';

class CustomPolicyBodyWidget extends StatelessWidget {
  const CustomPolicyBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolicyCubit, PolicyState>(
      builder: (context, state) {
        final cubit = context.read<PolicyCubit>();
        if (state is GetPolicyLoading) {
          return const CustomLoading();
        } else if (state is GetPolicyFailure) {
          return CustomError(
            error: state.error,
            retry: () {
               cubit.fetchPolicy();
            },
          );
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: HtmlWidget(
              cubit.policyData!,
              onLoadingBuilder: (context, element, loadingProgress) {
                return const CustomLoading();
              },
            ),
          );
        }
      },
    );
  }
}
