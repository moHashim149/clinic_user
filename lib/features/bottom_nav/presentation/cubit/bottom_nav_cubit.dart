import 'package:bloc/bloc.dart';
import 'package:brandy_user/features/orders/presentation/views/orders_view.dart';
import 'package:brandy_user/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../child/presentation/views/child_view.dart';
import '../../../men/presentation/views/men_view.dart';
import '../../../women/presentation/views/women_view.dart';
import '../../data/models/bottom_nav_item_model.dart';
part 'bottom_nav_state.dart';

@injectable
class BottomNavCubit extends Cubit<BottomNavState> {
  final SharedPrefServices appPref;
  BottomNavCubit(this.appPref) : super(BottomNavInitial());

  int currentIndex = 0;

  String? get token => appPref.getData(key: AppCached.token);

  void changeNavIndex({required int index}) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(ChangeNavBarIndex());
    }
  }

  List<Widget> screens = [
    WomenView(),
    MenView(),
    ChildView(),
    OrdersView(),
    ProfileView(),
  ];

  List<BottomNavItemModel> bottomNavigationBarItems = [
    BottomNavItemModel(title: LocaleKeys.women, icon: AppAssets.women),
    BottomNavItemModel(title: LocaleKeys.men, icon: AppAssets.men),
    BottomNavItemModel(title: LocaleKeys.child, icon: AppAssets.child),
    BottomNavItemModel(title: LocaleKeys.orders, icon: AppAssets.orders),
    BottomNavItemModel(title: LocaleKeys.profile, icon: AppAssets.profile),
  ];
}
