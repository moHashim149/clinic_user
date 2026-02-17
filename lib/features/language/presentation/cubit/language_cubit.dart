import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/local/shared_preferences/shared_pref_services.dart';
import 'package:brandy_user/features/language/data/arguments/language_arguments.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/app_cached.dart';
import '../../../../core/util/extensions/navigation.dart';

part 'language_state.dart';

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  final SharedPrefServices appPrefs;
  LanguageCubit(this.appPrefs) : super(LanguageInitial());

  int currentLangIndex = 0;

  void getCurrentLang({required BuildContext context}) {
    if (context.locale.languageCode == 'ar') {
      currentLangIndex = 0;
    } else {
      currentLangIndex = 1;
    }
    emit(LanguageLoaded());
  }

  void saveChanges(BuildContext context, int index,LanguageArguments arguments) {
    String lang = index == 0 ? 'ar' : 'en';
    context.setLocale(Locale(lang));
    appPrefs.saveData(AppCached.lang, lang);
    arguments.onUpdate();
    context.pop();

    emit(LanguageLoaded());
  }
}
