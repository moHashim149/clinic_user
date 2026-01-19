import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../core/constants/app_cached.dart';
import '../../data/repository/home_repository.dart';

part 'women_state.dart';

@injectable
class WomenCubit extends Cubit<WomenState> {
  final SharedPrefServices appPref;
  final HomeRepository homeRepository;

  WomenCubit(
    this.appPref,
    this.homeRepository,
  ) : super(WomenInitial());

  int currentPage = 0;
  // HomeModel? homeModel;
  // UserModel? userModel;

  void changePageIndex(int index) {
    currentPage = index;
    emit(ChangePageIndexState());
  }

  String? get token => appPref.getData(key: AppCached.token);

  // Future<void> fetchHome() async {
  //   emit(DataLoading());
  //   var result = await userHomeRepository.fetchHome();
  //   result.fold(
  //     (failure) {
  //       emit(DataFailure(error: failure.message));
  //     },
  //     (homeModel) {
  //       this.homeModel = homeModel;
  //       if (token != null) {
  //         fetchProfile();
  //       } else {
  //         emit(DataLoaded());
  //       }
  //     },
  //   );
  // }
  //
  // Future<void> fetchProfile() async {
  //   emit(DataLoading());
  //   var result = await userHomeRepository.fetchProfile();
  //   result.fold(
  //     (failure) {
  //       emit(DataFailure(error: failure.message));
  //     },
  //     (profileModel) {
  //       userModel = profileModel;
  //       fetchNotifications();
  //     },
  //   );
  // }
  //
  // Future<void> fetchNotifications() async {
  //   emit(DataLoading());
  //   var result = await notificationsRepository.fetchNotifications(
  //     NotificationsParam(page: 1),
  //   );
  //   result.fold(
  //     (failure) {
  //       emit(DataFailure(error: failure.message));
  //     },
  //     (notifications) {
  //       hasNotifications = notifications.list.isNotEmpty;
  //       emit(DataLoaded());
  //     },
  //   );
  // }
}
