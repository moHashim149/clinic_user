import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/constants/app_cached.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../../core/util/extensions/navigation.dart';
import '../../../../../../core/util/routing/routes.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SharedPrefServices appPref;
  final AppFirebase appFirebase;

  SplashCubit(this.appPref, this.appFirebase) : super(SplashInitial());

  void handlePageNext(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final isFirst = appPref.getData(key: AppCached.isFirst) ?? false;
      if (isFirst) {
        if (context.mounted) {
          context.pushAndRemoveUntilWithNamed(
            Routes.bottomNavView,
          );
        }
      } else {
        if (context.mounted) {
          context.pushAndRemoveUntilWithNamed(Routes.selectLanguageView);
        }
      }
      appFirebase.initializeFirebaseNotifications();
    });
  }
}
