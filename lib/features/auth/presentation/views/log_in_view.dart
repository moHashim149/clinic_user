import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/login_action_buttons.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/login_num_field_widget.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/login_page_logo.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/login_welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login_cubit/login_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final SignInCubit cubit = context.read<SignInCubit>();
          return SafeArea(
            child: AbsorbPointer(
              absorbing: state is CheckPhoneLoading,
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                     heightSpace(40),
                      const LoginPageLogo(),
                      heightSpace(12),
                      const LoginWelcomeText(),
                      heightSpace(16),
                       LoginNumFieldWidget(cubit: cubit),
                      heightSpace(40),
                       LoginActionButtons(cubit: cubit),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
