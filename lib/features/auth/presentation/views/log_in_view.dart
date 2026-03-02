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
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final cubit = context.read<SignInCubit>();
          return SafeArea(
            child: AbsorbPointer(
              absorbing: state is CheckPhoneLoading,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const LoginPageLogo(),
                    const SizedBox(height: 12),
                    const LoginWelcomeText(),
                    const SizedBox(height: 16),
                    const LoginNumFieldWidget(),
                    const SizedBox(height: 40),
                    const LoginActionButtons(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
