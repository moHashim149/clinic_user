// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brandy_user/core/api/api_consumer.dart' as _i506;
import 'package:brandy_user/core/api/dio_consumer.dart' as _i858;
import 'package:brandy_user/core/api/network_info.dart' as _i903;
import 'package:brandy_user/core/di/di_module.dart' as _i602;
import 'package:brandy_user/core/framework/app_firebase.dart' as _i973;
import 'package:brandy_user/core/framework/app_notification.dart' as _i108;
import 'package:brandy_user/core/framework/device_info.dart' as _i669;
import 'package:brandy_user/core/helpers/image_helper.dart' as _i15;
import 'package:brandy_user/core/local/shared_preferences/shared_pref_services.dart'
    as _i823;
import 'package:brandy_user/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i863;
import 'package:brandy_user/features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i300;
import 'package:brandy_user/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i266;
import 'package:brandy_user/features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i616;
import 'package:brandy_user/features/auth/data/repository/auth_repository.dart'
    as _i781;
import 'package:brandy_user/features/auth/data/repository/auth_repository_impl.dart'
    as _i658;
import 'package:brandy_user/features/auth/presentation/cubits/create_acc_cubit/create_acc_cubit.dart'
    as _i9;
import 'package:brandy_user/features/auth/presentation/cubits/login_cubit/login_cubit.dart'
    as _i262;
import 'package:brandy_user/features/auth/presentation/cubits/pin_code_cubit/pin_code_cubit.dart'
    as _i368;
import 'package:brandy_user/features/bottom_nav/presentation/cubit/bottom_nav_cubit.dart'
    as _i651;
import 'package:brandy_user/features/favorites/presentation/cubit/favorites_cubit.dart'
    as _i255;
import 'package:brandy_user/features/intro/select_language/presentation/cubit/select_language_cubit.dart'
    as _i1057;
import 'package:brandy_user/features/intro/splash/presentation/cubit/splash_cubit.dart'
    as _i272;
import 'package:brandy_user/features/order_details/presentation/cubit/order_details_cubit.dart'
    as _i812;
import 'package:brandy_user/features/orders/presentation/cubit/orders_cubit.dart'
    as _i337;
import 'package:brandy_user/features/product_details/presentation/cubit/product_details_cubit.dart'
    as _i723;
import 'package:brandy_user/features/store_details/presentation/cubit/store_details_cubit.dart'
    as _i924;
import 'package:brandy_user/features/women/data/data_source/remote/home_remote_data_source.dart'
    as _i517;
import 'package:brandy_user/features/women/data/data_source/remote/home_remote_data_source_impl.dart'
    as _i288;
import 'package:brandy_user/features/women/data/repository/home_repository.dart'
    as _i522;
import 'package:brandy_user/features/women/data/repository/home_repository_impl.dart'
    as _i688;
import 'package:brandy_user/features/women/presentation/cubit/women_cubit.dart'
    as _i932;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i161.InternetConnection>(
      () => injectionModule.internetConnection,
    );
    gh.factory<_i361.Dio>(() => injectionModule.dioClient);
    gh.factory<_i183.ImagePicker>(() => injectionModule.imagePicker);
    gh.factory<_i108.AppNotifications>(() => _i108.AppNotifications());
    gh.factory<_i669.DeviceInfo>(() => _i669.DeviceInfo());
    gh.factory<_i15.DocumentHelper>(() => _i15.DocumentHelper());
    gh.factory<_i255.FavoritesCubit>(() => _i255.FavoritesCubit());
    gh.factory<_i812.OrderDetailsCubit>(() => _i812.OrderDetailsCubit());
    gh.factory<_i337.OrdersCubit>(() => _i337.OrdersCubit());
    gh.factory<_i723.ProductDetailsCubit>(() => _i723.ProductDetailsCubit());
    gh.factory<_i924.StoreDetailsCubit>(() => _i924.StoreDetailsCubit());
    gh.factory<_i973.AppFirebase>(
      () => _i973.AppFirebase(appNotifications: gh<_i108.AppNotifications>()),
    );
    gh.factory<_i903.NetworkInfo>(
      () => _i903.NetworkInfoImpl(
        internetConnection: gh<_i161.InternetConnection>(),
      ),
    );
    gh.lazySingleton<_i823.SharedPrefServices>(
      () => _i823.SharedPrefServices(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i651.BottomNavCubit>(
      () => _i651.BottomNavCubit(gh<_i823.SharedPrefServices>()),
    );
    gh.factory<_i1057.SelectLanguageCubit>(
      () => _i1057.SelectLanguageCubit(gh<_i823.SharedPrefServices>()),
    );
    gh.lazySingleton<_i506.ApiConsumer>(
      () => _i858.DioApiConsumer(
        networkInfo: gh<_i903.NetworkInfo>(),
        dioClient: gh<_i361.Dio>(),
        appPref: gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i272.SplashCubit>(
      () => _i272.SplashCubit(
        gh<_i823.SharedPrefServices>(),
        gh<_i973.AppFirebase>(),
      ),
    );
    gh.factory<_i863.AuthLocalDataSource>(
      () => _i300.AuthLocalDataSourceImpl(
        appPref: gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i266.AuthRemoteDataSource>(
      () =>
          _i616.AuthRemoteDataSourceImpl(apiConsumer: gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i517.HomeRemoteDataSource>(
      () => _i288.HomeRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i781.AuthRepository>(
      () => _i658.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i266.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i863.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i522.HomeRepository>(
      () => _i688.HomeRepositoryImpl(gh<_i517.HomeRemoteDataSource>()),
    );
    gh.factory<_i9.CreateAccCubit>(
      () => _i9.CreateAccCubit(
        gh<_i781.AuthRepository>(),
        gh<_i973.AppFirebase>(),
        gh<_i15.DocumentHelper>(),
      ),
    );
    gh.factory<_i368.PinCodeCubit>(
      () => _i368.PinCodeCubit(gh<_i781.AuthRepository>()),
    );
    gh.factory<_i262.SignInCubit>(
      () => _i262.SignInCubit(
        gh<_i781.AuthRepository>(),
        gh<_i973.AppFirebase>(),
      ),
    );
    gh.factory<_i932.WomenCubit>(
      () => _i932.WomenCubit(
        gh<_i823.SharedPrefServices>(),
        gh<_i522.HomeRepository>(),
      ),
    );
    return this;
  }
}

class _$InjectionModule extends _i602.InjectionModule {}
