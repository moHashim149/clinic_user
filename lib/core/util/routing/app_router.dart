import 'dart:io';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/addresses/presentation/views/addresses_view.dart';
import 'package:brandy_user/features/auth/data/arguments/create_acc_argument.dart';
import 'package:brandy_user/features/auth/presentation/cubits/create_acc_cubit/create_acc_cubit.dart';
import 'package:brandy_user/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:brandy_user/features/cart/presentation/views/cart_view.dart';
import 'package:brandy_user/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:brandy_user/features/chat/presentation/views/chat_view.dart';
import 'package:brandy_user/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:brandy_user/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:brandy_user/features/favorites/presentation/views/favorites_view.dart';
import 'package:brandy_user/features/language/presentation/cubit/language_cubit.dart';
import 'package:brandy_user/features/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:brandy_user/features/order_details/presentation/views/order_details_view.dart';
import 'package:brandy_user/features/payment_methods/presentation/cubit/payment_methods_cubit.dart';
import 'package:brandy_user/features/payment_methods/presentation/views/payment_methods_view.dart';
import 'package:brandy_user/features/static_pages/terms/presentation/cubit/terms_and_cond_cubit.dart';
import 'package:brandy_user/features/store_details/data/arguments/store_details_arguments.dart';
import 'package:brandy_user/features/store_details/presentation/cubit/store_details_cubit.dart';
import 'package:brandy_user/features/store_details/presentation/views/store_details_view.dart';
import 'package:brandy_user/features/stories/presentation/views/stories_view.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/addresses/data/arguments/select_address_argument.dart';
import '../../../features/addresses/presentation/cubit/addresses_cubit.dart';
import '../../../features/addresses/presentation/cubit/search_places_cubit/search_places_bloc.dart';
import '../../../features/addresses/presentation/cubit/select_location_cubit/select_location_cubit.dart';
import '../../../features/addresses/presentation/views/select_address_view.dart';
import '../../../features/auth/data/arguments/pin_code_argument.dart';
import '../../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../../features/auth/presentation/cubits/pin_code_cubit/pin_code_cubit.dart';
import '../../../features/auth/presentation/views/create_acc_view.dart';
import '../../../features/auth/presentation/views/pin_code_view.dart';
import '../../../features/auth/presentation/views/sign_in_view.dart';
import '../../../features/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';
import '../../../features/bottom_nav/presentation/views/bottom_nav_view.dart';
import '../../../features/cart/data/arguments/cart_arguments.dart';
import '../../../features/chat/data/arguments/chat_arguments.dart';
import '../../../features/edit_profile/presentation/views/edit_profile_view.dart';
import '../../../features/intro/select_language/presentation/cubit/select_language_cubit.dart';
import '../../../features/intro/select_language/presentation/views/select_language_view.dart';
import '../../../features/intro/splash/presentation/cubit/splash_cubit.dart';
import '../../../features/intro/splash/presentation/views/splash_view.dart';
import '../../../features/language/presentation/views/language_view.dart';
import '../../../features/order_details/data/arguments/order_details_arguments.dart';
import '../../../features/payment_methods/data/data_source/arguments/payment_methods_arguments.dart';
import '../../../features/product_details/data/arguments/product_details_arguments.dart';
import '../../../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../../../features/product_details/presentation/views/product_details_view.dart';
import '../../../features/static_pages/policy/presentation/cubit/policy_cubit.dart';
import '../../../features/static_pages/policy/presentation/views/policy_view.dart';
import '../../../features/static_pages/terms/presentation/views/terms_view.dart';
import '../../../features/stories/data/arguments/stories_arguments.dart';
import '../../../features/wallet/data/arguments/charge_wallet_argument.dart';
import '../../../features/wallet/presentation/cubits/add_balance_cubit/charge_wallet_cubit.dart';
import '../../../features/wallet/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import '../../../features/wallet/presentation/views/charge_wallet_view.dart';
import '../../../features/wallet/presentation/views/wallet_view.dart';
import '../../di/di.dart';
import '../../framework/navigation_animation.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashView(),
          ),
        );
      case Routes.selectLanguageView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SelectLanguageCubit>(),
            child: const SelectLanguageView(),
          ),
        );
      case Routes.bottomNavView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BottomNavCubit>(),
            child: BottomNavView(),
          ),
        );
      case Routes.favoritesView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FavoritesCubit>()..fetchFavorites(),
            child: FavoritesView(),
          ),
        );
      case Routes.storeDetailsView:
        StoreDetailsArguments args = arguments as StoreDetailsArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<StoreDetailsCubit>()..fetchStoreDetails(args.storeId),
            child: StoreDetailsView(storeDetailsArguments: args),
          ),
        );
      case Routes.productDetailsView:
        ProductDetailsArguments args = arguments as ProductDetailsArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<ProductDetailsCubit>()
                  ..fetchProductDetails(args.productId),
            child: ProductDetailsView(productDetailsArguments: args),
          ),
        );
      case Routes.cartView:
        var args = arguments as CartArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CartCubit>()..fetchCart(),
            child: CartView(
              cartArguments: args,
            ),
          ),
        );
      case Routes.paymentMethodsView:
        var args = arguments as PaymentMethodsArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PaymentMethodsCubit>()..fetchPayments(),
            child: PaymentMethodsView(arguments: args),
          ),
        );
      case Routes.signInView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignInCubit>(),
            child: const SignInView(),
          ),
        );

      case Routes.pinCodeView:
        final pinCodeArguments = arguments as PinCodeArgument;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PinCodeCubit>(),
            child: PinCodeView(argument: pinCodeArguments),
          ),
        );
      case Routes.createAccountView:
        var args = arguments as CreateAccArgument;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CreateAccCubit>()..fetchCities(),
            child: CreateAccView(argument: args),
          ),
        );
      case Routes.orderDetailsView:
        var args = arguments as OrderDetailsArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<OrderDetailsCubit>()..fetchOrderDetails(args.orderId),
            child: OrderDetailsView(args: args),
          ),
        );
      case Routes.chatView:
        final chatArguments = arguments as ChatArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChatCubit>()..fetchChat(chatArguments.chatId),
            child: ChatView(chatArguments: chatArguments),
          ),
        );
      case Routes.editProfileView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>()..fetchProfile(),
            child: EditProfileView(),
          ),
        );
      case Routes.languageView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LanguageCubit>(),
            child: LanguageView(),
          ),
        );
      case Routes.storiesView:
        final args = arguments as StoriesArguments;
        return _buildRoute(builder: (_) => StoriesView(arguments: args));
      case Routes.policyView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PolicyCubit>()..fetchPolicy(),
            child: PolicyView(),
          ),
        );
      case Routes.termsView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TermsAndCondCubit>()..fetchTerms(),
            child: TermsView(),
          ),
        );
      case Routes.walletView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WalletCubit>()..fetchWallet(),
            child: WalletView(),
          ),
        );
      case Routes.chargeWalletView:
        final argument = arguments as ChargeWalletArgument;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChargeWalletCubit>()..fetchPayments(),
            child: ChargeWalletView(argument: argument),
          ),
        );
      case Routes.addressesView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddressesCubit>()..fetchAddresses(),
            child: AddressesView(),
          ),
        );
      case Routes.selectAddressView:
        final argument = arguments as SelectAddressArgument;
        return _buildRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SearchPlacesBloc>()),
              BlocProvider(
                create: (context) =>
                    getIt<SelectLocationCubit>()
                      ..checkCurrentLocation(argument: argument),
              ),
            ],
            child: SelectAddressView(argument: argument),
          ),
        );

      default:
        return _buildRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${LocaleKeys.noRouteDefined.tr()} ${settings.name}'),
            ),
          ),
        );
    }
  }

  PageRoute _buildRoute({required WidgetBuilder builder}) {
    return Platform.isAndroid
        ? FadePageRoute(builder: builder)
        : MaterialPageRoute(builder: builder);
  }
}
