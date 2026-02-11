import 'package:brandy_user/features/static_pages/policy/presentation/views/widgets/custom_about_us_body_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.privacyPolicy.tr()),
      body: CustomPolicyBodyWidget(),
    );
  }
}
