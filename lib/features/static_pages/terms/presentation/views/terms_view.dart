import 'package:brandy_user/features/static_pages/terms/presentation/views/widgets/custom_terms_body_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/locale_keys.g.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(title: LocaleKeys.terms.tr()),
      body: CustomTermsBodyWidget());
  }
}
