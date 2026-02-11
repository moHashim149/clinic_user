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
import 'package:brandy_user/features/addresses/data/data_source/remote/addresses_remote_data_source.dart'
    as _i178;
import 'package:brandy_user/features/addresses/data/data_source/remote/addresses_remote_data_source_impl.dart'
    as _i541;
import 'package:brandy_user/features/addresses/data/repository/addresses_repository.dart'
    as _i254;
import 'package:brandy_user/features/addresses/data/repository/addresses_repository_impl.dart'
    as _i184;
import 'package:brandy_user/features/addresses/presentation/cubit/addresses_cubit.dart'
    as _i507;
import 'package:brandy_user/features/addresses/presentation/cubit/search_places_cubit/search_places_bloc.dart'
    as _i70;
import 'package:brandy_user/features/addresses/presentation/cubit/select_location_cubit/select_location_cubit.dart'
    as _i541;
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
import 'package:brandy_user/features/cart/data/data_source/remote/cart_remote_data_source.dart'
    as _i712;
import 'package:brandy_user/features/cart/data/data_source/remote/cart_remote_data_source_impl.dart'
    as _i306;
import 'package:brandy_user/features/cart/data/repository/cart_repository.dart'
    as _i98;
import 'package:brandy_user/features/cart/data/repository/cart_repository_impl.dart'
    as _i529;
import 'package:brandy_user/features/cart/presentation/cubit/cart_cubit.dart'
    as _i92;
import 'package:brandy_user/features/chat/data/data_source/remote/chat_remote_data_source.dart'
    as _i728;
import 'package:brandy_user/features/chat/data/data_source/remote/chat_remote_data_source_impl.dart'
    as _i626;
import 'package:brandy_user/features/chat/data/repository/chat_repository.dart'
    as _i798;
import 'package:brandy_user/features/chat/data/repository/chat_repository_impl.dart'
    as _i310;
import 'package:brandy_user/features/chat/presentation/cubit/chat_cubit.dart'
    as _i447;
import 'package:brandy_user/features/edit_profile/data/data_source/edit_profile_remote_data_source.dart'
    as _i495;
import 'package:brandy_user/features/edit_profile/data/data_source/edit_profile_remote_data_source_impl.dart'
    as _i608;
import 'package:brandy_user/features/edit_profile/data/repository/edit_profile_repository.dart'
    as _i939;
import 'package:brandy_user/features/edit_profile/data/repository/edit_profile_repository_impl.dart'
    as _i213;
import 'package:brandy_user/features/edit_profile/presentation/cubit/edit_profile_cubit.dart'
    as _i52;
import 'package:brandy_user/features/favorites/data/data_source/remote/favorites_remote_data_source.dart'
    as _i282;
import 'package:brandy_user/features/favorites/data/data_source/remote/favorites_remote_data_source_impl.dart'
    as _i462;
import 'package:brandy_user/features/favorites/data/repository/favorites_repository.dart'
    as _i427;
import 'package:brandy_user/features/favorites/data/repository/favorites_repository_impl.dart'
    as _i228;
import 'package:brandy_user/features/favorites/presentation/cubit/favorites_cubit.dart'
    as _i255;
import 'package:brandy_user/features/intro/select_language/presentation/cubit/select_language_cubit.dart'
    as _i1057;
import 'package:brandy_user/features/intro/splash/presentation/cubit/splash_cubit.dart'
    as _i272;
import 'package:brandy_user/features/language/presentation/cubit/language_cubit.dart'
    as _i744;
import 'package:brandy_user/features/order_details/data/data_source/remote/order_details_remote_data_source.dart'
    as _i806;
import 'package:brandy_user/features/order_details/data/data_source/remote/orders_details_remote_data_source_impl.dart'
    as _i387;
import 'package:brandy_user/features/order_details/data/repository/order_details_repository.dart'
    as _i359;
import 'package:brandy_user/features/order_details/data/repository/order_details_repository_impl.dart'
    as _i745;
import 'package:brandy_user/features/order_details/presentation/cubit/order_details_cubit.dart'
    as _i812;
import 'package:brandy_user/features/orders/data/data_source/remote/orders_remote_data_source.dart'
    as _i42;
import 'package:brandy_user/features/orders/data/data_source/remote/orders_remote_data_source_impl.dart'
    as _i515;
import 'package:brandy_user/features/orders/data/repository/orders_repository.dart'
    as _i484;
import 'package:brandy_user/features/orders/data/repository/orders_repository_impl.dart'
    as _i65;
import 'package:brandy_user/features/orders/presentation/cubit/orders_cubit.dart'
    as _i337;
import 'package:brandy_user/features/payment_methods/data/data_source/remote/payment_methods_remote_data_source.dart'
    as _i111;
import 'package:brandy_user/features/payment_methods/data/data_source/remote/payment_methods_remote_data_source_impl.dart'
    as _i943;
import 'package:brandy_user/features/payment_methods/data/repository/payment_methods_repository.dart'
    as _i20;
import 'package:brandy_user/features/payment_methods/data/repository/payment_methods_repository_impl.dart'
    as _i626;
import 'package:brandy_user/features/payment_methods/presentation/cubit/payment_methods_cubit.dart'
    as _i480;
import 'package:brandy_user/features/product_details/data/data_source/remote/product_details_remote_data_source.dart'
    as _i360;
import 'package:brandy_user/features/product_details/data/data_source/remote/product_details_remote_data_source_impl.dart'
    as _i800;
import 'package:brandy_user/features/product_details/data/repository/product_details_repository.dart'
    as _i583;
import 'package:brandy_user/features/product_details/data/repository/product_details_repository_impl.dart'
    as _i495;
import 'package:brandy_user/features/product_details/presentation/cubit/product_details_cubit.dart'
    as _i723;
import 'package:brandy_user/features/profile/data/data_source/local/profile_local_data_source.dart'
    as _i241;
import 'package:brandy_user/features/profile/data/data_source/local/profile_local_data_source_impl.dart'
    as _i548;
import 'package:brandy_user/features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i870;
import 'package:brandy_user/features/profile/data/data_source/remote/profile_remote_data_source_impl.dart'
    as _i616;
import 'package:brandy_user/features/profile/data/repository/profile_repository.dart'
    as _i778;
import 'package:brandy_user/features/profile/data/repository/profile_repository_impl.dart'
    as _i564;
import 'package:brandy_user/features/profile/presentation/cubit/profile_cubit.dart'
    as _i331;
import 'package:brandy_user/features/static_pages/data/data_source/remote/static_pages_remote_data_source.dart'
    as _i455;
import 'package:brandy_user/features/static_pages/data/data_source/remote/static_pages_remote_data_source_impl.dart'
    as _i324;
import 'package:brandy_user/features/static_pages/data/repository/static_pages_repository.dart'
    as _i687;
import 'package:brandy_user/features/static_pages/data/repository/static_pages_repository_impl.dart'
    as _i214;
import 'package:brandy_user/features/static_pages/policy/presentation/cubit/policy_cubit.dart'
    as _i858;
import 'package:brandy_user/features/static_pages/terms/presentation/cubit/terms_and_cond_cubit.dart'
    as _i350;
import 'package:brandy_user/features/store_details/data/data_source/remote/store_details_remote_data_source.dart'
    as _i630;
import 'package:brandy_user/features/store_details/data/data_source/remote/store_details_remote_data_source_impl.dart'
    as _i444;
import 'package:brandy_user/features/store_details/data/repository/store_details_repository.dart'
    as _i709;
import 'package:brandy_user/features/store_details/data/repository/store_details_repository_impl.dart'
    as _i110;
import 'package:brandy_user/features/store_details/presentation/cubit/store_details_cubit.dart'
    as _i924;
import 'package:brandy_user/features/wallet/data/data_source/remote/wallet_remote_data_source.dart'
    as _i505;
import 'package:brandy_user/features/wallet/data/data_source/remote/wallet_remote_data_source_impl.dart'
    as _i843;
import 'package:brandy_user/features/wallet/data/repository/wallet_repository.dart'
    as _i276;
import 'package:brandy_user/features/wallet/data/repository/wallet_repository_impl.dart'
    as _i211;
import 'package:brandy_user/features/wallet/presentation/cubits/add_balance_cubit/charge_wallet_cubit.dart'
    as _i699;
import 'package:brandy_user/features/wallet/presentation/cubits/wallet_cubit/wallet_cubit.dart'
    as _i57;
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
    gh.factory<_i70.SearchPlacesBloc>(() => _i70.SearchPlacesBloc());
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
    gh.factory<_i360.ProductDetailsRemoteDataSource>(
      () => _i800.ProductDetailsRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i728.ChatRemoteDataSource>(
      () =>
          _i626.ChatRemoteDataSourceImpl(apiConsumer: gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i272.SplashCubit>(
      () => _i272.SplashCubit(
        gh<_i823.SharedPrefServices>(),
        gh<_i973.AppFirebase>(),
      ),
    );
    gh.factory<_i178.AddressesRemoteDataSource>(
      () => _i541.AddressesRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i505.WalletRemoteDataSource>(
      () => _i843.WalletRemoteDataSourceImpl(
        apiConsumer: gh<_i506.ApiConsumer>(),
      ),
    );
    gh.factory<_i744.LanguageCubit>(
      () => _i744.LanguageCubit(gh<_i823.SharedPrefServices>()),
    );
    gh.factory<_i798.ChatRepository>(
      () => _i310.ChatRepositoryImpl(
        chatRemoteDataSource: gh<_i728.ChatRemoteDataSource>(),
      ),
    );
    gh.factory<_i241.ProfileLocalDataSource>(
      () => _i548.ProfileLocalDataSourceImpl(
        appPref: gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i863.AuthLocalDataSource>(
      () => _i300.AuthLocalDataSourceImpl(
        appPref: gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i447.ChatCubit>(
      () => _i447.ChatCubit(
        gh<_i798.ChatRepository>(),
        gh<_i15.DocumentHelper>(),
        gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i495.EditProfileRemoteDataSource>(
      () => _i608.EditProfileRemoteDataSourceImpl(
        apiConsumer: gh<_i506.ApiConsumer>(),
      ),
    );
    gh.factory<_i455.StaticPagesRemoteDataSource>(
      () => _i324.StaticPagesRemoteDataSourceImpl(
        apiConsumer: gh<_i506.ApiConsumer>(),
      ),
    );
    gh.factory<_i687.StaticPagesRepository>(
      () => _i214.StaticPagesRepositoryImpl(
        staticPagesRemoteDataSource: gh<_i455.StaticPagesRemoteDataSource>(),
      ),
    );
    gh.factory<_i870.ProfileRemoteDataSource>(
      () => _i616.ProfileRemoteDataSourceImpl(
        apiConsumer: gh<_i506.ApiConsumer>(),
      ),
    );
    gh.factory<_i266.AuthRemoteDataSource>(
      () =>
          _i616.AuthRemoteDataSourceImpl(apiConsumer: gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i583.ProductDetailsRepository>(
      () => _i495.ProductDetailsRepositoryImpl(
        gh<_i360.ProductDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i939.EditProfileRepository>(
      () => _i213.EditProfileRepositoryImpl(
        editProfileRemoteDataSource: gh<_i495.EditProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i282.FavoritesRemoteDataSource>(
      () => _i462.FavoritesRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i42.OrdersRemoteDataSource>(
      () => _i515.OrdersRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i712.CartRemoteDataSource>(
      () =>
          _i306.CartRemoteDataSourceImpl(apiConsumer: gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i276.WalletRepository>(
      () => _i211.WalletRepositoryImpl(
        walletRemoteDataSource: gh<_i505.WalletRemoteDataSource>(),
      ),
    );
    gh.factory<_i517.HomeRemoteDataSource>(
      () => _i288.HomeRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i111.PaymentMethodsRemoteDataSource>(
      () => _i943.PaymentMethodsRemoteDataSourceImpl(
        apiConsumer: gh<_i506.ApiConsumer>(),
      ),
    );
    gh.factory<_i858.PolicyCubit>(
      () => _i858.PolicyCubit(gh<_i687.StaticPagesRepository>()),
    );
    gh.factory<_i350.TermsAndCondCubit>(
      () => _i350.TermsAndCondCubit(gh<_i687.StaticPagesRepository>()),
    );
    gh.factory<_i630.StoreDetailsRemoteDataSource>(
      () => _i444.StoreDetailsRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i806.OrderDetailsRemoteDataSource>(
      () => _i387.OrderDetailsRemoteDataSourceImpl(gh<_i506.ApiConsumer>()),
    );
    gh.factory<_i254.AddressesRepository>(
      () =>
          _i184.AddressesRepositoryImpl(gh<_i178.AddressesRemoteDataSource>()),
    );
    gh.factory<_i709.StoreDetailsRepository>(
      () => _i110.StoreDetailsRepositoryImpl(
        gh<_i630.StoreDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i781.AuthRepository>(
      () => _i658.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i266.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i863.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i699.ChargeWalletCubit>(
      () => _i699.ChargeWalletCubit(gh<_i276.WalletRepository>()),
    );
    gh.factory<_i57.WalletCubit>(
      () => _i57.WalletCubit(gh<_i276.WalletRepository>()),
    );
    gh.factory<_i427.FavoritesRepository>(
      () =>
          _i228.FavoritesRepositoryImpl(gh<_i282.FavoritesRemoteDataSource>()),
    );
    gh.factory<_i20.PaymentMethodsRepository>(
      () => _i626.PaymentMethodsRepositoryImpl(
        paymentMethodsRemoteDataSource:
            gh<_i111.PaymentMethodsRemoteDataSource>(),
      ),
    );
    gh.factory<_i359.OrderDetailsRepository>(
      () => _i745.OrderDetailsRepositoryImpl(
        gh<_i806.OrderDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i522.HomeRepository>(
      () => _i688.HomeRepositoryImpl(gh<_i517.HomeRemoteDataSource>()),
    );
    gh.factory<_i52.EditProfileCubit>(
      () => _i52.EditProfileCubit(
        gh<_i522.HomeRepository>(),
        gh<_i15.DocumentHelper>(),
        gh<_i939.EditProfileRepository>(),
      ),
    );
    gh.factory<_i9.CreateAccCubit>(
      () => _i9.CreateAccCubit(
        gh<_i781.AuthRepository>(),
        gh<_i973.AppFirebase>(),
        gh<_i15.DocumentHelper>(),
      ),
    );
    gh.factory<_i262.SignInCubit>(
      () => _i262.SignInCubit(
        gh<_i781.AuthRepository>(),
        gh<_i973.AppFirebase>(),
      ),
    );
    gh.factory<_i368.PinCodeCubit>(
      () => _i368.PinCodeCubit(
        gh<_i781.AuthRepository>(),
        gh<_i973.AppFirebase>(),
      ),
    );
    gh.factory<_i812.OrderDetailsCubit>(
      () => _i812.OrderDetailsCubit(gh<_i359.OrderDetailsRepository>()),
    );
    gh.factory<_i255.FavoritesCubit>(
      () => _i255.FavoritesCubit(gh<_i427.FavoritesRepository>()),
    );
    gh.factory<_i480.PaymentMethodsCubit>(
      () => _i480.PaymentMethodsCubit(
        gh<_i20.PaymentMethodsRepository>(),
        gh<_i276.WalletRepository>(),
      ),
    );
    gh.factory<_i778.ProfileRepository>(
      () => _i564.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i870.ProfileRemoteDataSource>(),
        profileLocalDataSource: gh<_i241.ProfileLocalDataSource>(),
      ),
    );
    gh.factory<_i98.CartRepository>(
      () => _i529.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i712.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i932.WomenCubit>(
      () => _i932.WomenCubit(
        gh<_i823.SharedPrefServices>(),
        gh<_i522.HomeRepository>(),
        gh<_i427.FavoritesRepository>(),
      ),
    );
    gh.factory<_i507.AddressesCubit>(
      () => _i507.AddressesCubit(gh<_i254.AddressesRepository>()),
    );
    gh.factory<_i484.OrdersRepository>(
      () => _i65.OrdersRepositoryImpl(gh<_i42.OrdersRemoteDataSource>()),
    );
    gh.factory<_i331.ProfileCubit>(
      () => _i331.ProfileCubit(
        gh<_i778.ProfileRepository>(),
        gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i541.SelectLocationCubit>(
      () => _i541.SelectLocationCubit(
        gh<_i781.AuthRepository>(),
        gh<_i254.AddressesRepository>(),
      ),
    );
    gh.factory<_i723.ProductDetailsCubit>(
      () => _i723.ProductDetailsCubit(
        gh<_i583.ProductDetailsRepository>(),
        gh<_i98.CartRepository>(),
        gh<_i823.SharedPrefServices>(),
      ),
    );
    gh.factory<_i924.StoreDetailsCubit>(
      () => _i924.StoreDetailsCubit(
        gh<_i709.StoreDetailsRepository>(),
        gh<_i823.SharedPrefServices>(),
        gh<_i98.CartRepository>(),
        gh<_i427.FavoritesRepository>(),
      ),
    );
    gh.factory<_i92.CartCubit>(
      () => _i92.CartCubit(
        gh<_i98.CartRepository>(),
        gh<_i823.SharedPrefServices>(),
        gh<_i254.AddressesRepository>(),
      ),
    );
    gh.factory<_i337.OrdersCubit>(
      () => _i337.OrdersCubit(gh<_i484.OrdersRepository>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i602.InjectionModule {}
