import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_empty_data_widget.dart';
import 'package:brandy_user/features/addresses/data/arguments/select_address_argument.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../cubit/addresses_cubit.dart';
import '../widgets/custom_address_list_widget.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.savedAddresses.tr(),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child:
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.add,
                      color: AppColors.primaryColor,
                      width: 20.w,
                      height: 20.h,
                    ),
                    widthSpace(4.w),
                    Text(
                      LocaleKeys.add.tr(),
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ).onTap(
                  function: () {
                    context.pushWithNamed(
                      Routes.selectAddressView,
                      arguments: SelectAddressArgument(
                        onUpdate: () {
                          context.read<AddressesCubit>().fetchAddresses();
                        },
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
      body: BlocBuilder<AddressesCubit, AddressesState>(
        builder: (context, state) {
          final cubit = context.read<AddressesCubit>();
          if (state is AddressesLoading) {
            return CustomLoading();
          } else if (state is AddressesFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchAddresses();
              },
            );
          } else {
            return cubit.addresses.isNotEmpty
                ? CustomAddressListWidget(
                    addresses: cubit.addresses,
                    onUpdate: () {
                      cubit.fetchAddresses();
                    },
                  )
                : CustomEmptyDataWidget(
                    text: LocaleKeys.emptySavedAddresses.tr(),
                  );
          }
        },
      ),
    );
  }
}
