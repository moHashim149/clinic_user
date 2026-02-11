import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/features/addresses/presentation/cubit/addresses_cubit.dart';
import 'package:brandy_user/features/addresses/presentation/widgets/custom_delete_address_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/framework/app_validator.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/arguments/select_address_argument.dart';
import '../cubit/select_location_cubit/select_location_cubit.dart';
import '../widgets/select_address_widgets/custom_search_location_widget.dart';

class SelectAddressView extends StatelessWidget {
  final SelectAddressArgument argument;

  const SelectAddressView({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: argument.addressModel != null
            ? LocaleKeys.editAddress.tr()
            : LocaleKeys.addNewAddress.tr(),
      ),
      body: BlocBuilder<SelectLocationCubit, SelectLocationState>(
        builder: (context, state) {
          final cubit = context.read<SelectLocationCubit>();
          return AbsorbPointer(
            absorbing:
                state is AddAddressLoading || state is UpdateAddressLoading,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GoogleMap(
                        onMapCreated: cubit.onMapCreate,
                        initialCameraPosition: CameraPosition(
                          target:
                              cubit.currentLocation ?? cubit.defaultLocation,
                          zoom: 15.0,
                        ),
                        onCameraMove: (cameraPos) {
                          if (cubit.currentLocation != cameraPos.target) {
                            cubit.onUpdateCamera(position: cameraPos);
                          }
                        },
                        onTap: (LatLng newPosition) {
                          cubit.updateLocationOnTap(newLocation: newPosition);
                        },
                        markers: {
                          if (cubit.currentLocation != null &&
                              cubit.markerIcon != null)
                            Marker(
                              markerId: const MarkerId('current_location'),
                              position: cubit.currentLocation!,
                              icon: cubit.markerIcon!,
                            ),
                        },
                      ),
                      Positioned(
                        right: 24.w,
                        left: 24.w,
                        top: 24.h,
                        child: CustomSearchLocationWidget(cubit: cubit),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.pin),
                                  widthSpace(9.w),
                                  Text(
                                    LocaleKeys.deliveryLocation.tr(),
                                    style: AppTextStyles.textStyle14.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackTextEighthColor,
                                    ),
                                  ),
                                ],
                              ),
                              heightSpace(16.h),
                              Text(
                                cubit.currentLocationName ?? "",
                                style: AppTextStyles.textStyle14.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.hintColor,
                                ),
                              ),
                              heightSpace(21.h),
                              Form(
                                key: cubit.formKey,
                                child: CustomTextFormField(
                                  ctrl: cubit.nameCtrl,
                                  validator: AppValidator.addressNameValidator,
                                  hintText: LocaleKeys.addressNameHint.tr(),
                                ),
                              ),
                              heightSpace(50.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      onPressed: () {
                                        if (argument.addressModel != null) {
                                          cubit.updateAddress(
                                            argument.addressModel!.id,
                                            context,
                                            argument.onUpdate,
                                          );
                                        } else {
                                          cubit.addAddress(
                                            context,
                                            argument.onUpdate,
                                          );
                                        }
                                      },
                                      isLoading:
                                          state is AddAddressLoading ||
                                          state is UpdateAddressLoading,
                                      text: argument.addressModel != null
                                          ? LocaleKeys.confirmLocation.tr()
                                          : LocaleKeys.saveAddress.tr(),
                                    ),
                                  ),
                                  if (argument.addressModel != null) ...[
                                    widthSpace(18.w),
                                    SvgPicture.asset(
                                      AppAssets.delete,
                                      width: 32.w,
                                      height: 32.h,
                                    ).onTap(
                                      function: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return BlocProvider.value(
                                              value: cubit,
                                              child:
                                                  BlocBuilder<
                                                    SelectLocationCubit,
                                                    SelectLocationState
                                                  >(
                                                    builder: (context, state) {
                                                      var cubit = context
                                                          .read<
                                                            SelectLocationCubit
                                                          >();
                                                      return CustomDeleteAddressDialog(
                                                        isLoading:
                                                            state
                                                                is DeleteAddressLoading,
                                                        onTapDeleteAddress: () {
                                                          cubit.deleteAddress(
                                                            context,
                                                            argument
                                                                .addressModel!
                                                                .id,
                                                            argument.onUpdate,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
