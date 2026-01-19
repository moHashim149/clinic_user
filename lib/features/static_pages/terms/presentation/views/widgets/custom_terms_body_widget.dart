import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/widgets/custom_error.dart';
import '../../../../../../../core/widgets/custom_loading.dart';
import '../../cubit/terms_and_cond_cubit.dart';

class CustomTermsBodyWidget extends StatelessWidget {
  const CustomTermsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsAndCondCubit, TermsAndCondState>(
      builder: (context, state) {
        final cubit = context.read<TermsAndCondCubit>();
        if (state is GetTermsLoading) {
          return const CustomLoading();
        } else if (state is GetTermsFailure) {
          return CustomError(
            error: state.error,
            retry: () {
              // cubit.fetchTerms();
            },
          );
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: HtmlWidget(
              cubit.termsData!,
              onLoadingBuilder: (context, element, loadingProgress) =>
                  const CustomLoading(),
            ),
          );
        }
      },
    );
  }
}
