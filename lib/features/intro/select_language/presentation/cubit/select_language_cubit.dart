import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/constants/app_cached.dart';
import '../../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../core/util/extensions/navigation.dart';
import '../../../../../core/util/routing/routes.dart';

part 'select_language_state.dart';

@injectable
class SelectLanguageCubit extends Cubit<SelectLanguageState> {
  final SharedPrefServices appPref;

  SelectLanguageCubit(this.appPref) : super(SelectLanguageInitial());

  int selectedIndex = 0;

  void changeIndex({required int index}) {
    selectedIndex = index;
    emit(ChangeLanguageState());
  }

  void saveChanges(BuildContext context) {
    context.setLocale(Locale(selectedIndex == 0 ? 'ar' : "en"));
    appPref.saveData(AppCached.lang, selectedIndex == 0 ? 'ar' : "en");
    appPref.saveData(AppCached.isFirst, true);
    context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
  }
}
