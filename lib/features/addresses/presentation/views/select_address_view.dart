import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
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
      // appBar: CustomAppBar(
      //     title: argument.addressModel != null
      //         ? LocaleKeys.editAddress.tr()
      //         : LocaleKeys.addNewAddress.tr(),
      //   ),
      body: SafeArea(
        child: BlocBuilder<SelectLocationCubit, SelectLocationState>(
          builder: (context, state) {
            final cubit = context.read<SelectLocationCubit>();
            return AbsorbPointer(
              absorbing:
                  state is AddAddressLoading || state is UpdateAddressLoading,
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: cubit.onMapCreate,
                    initialCameraPosition: CameraPosition(
                      target: cubit.currentLocation ?? cubit.defaultLocation,
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
                    myLocationEnabled: false,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
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
                    top: 24.h,
                    right: 24.w,
                    left: 24.w,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border.all(color: AppColors.stroke),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppColors.primary,
                              size: 24.r,
                            ),
                          ),
                        ),
                        widthSpace(8.w),
                        Expanded(
                          child: CustomSearchLocationWidget(cubit: cubit),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 240.h,
                    left: 24.w,
                    child: InkWell(
                      onTap: () => cubit.getCurrentLocation(isApple: false),
                      child: Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.my_location,
                          color: AppColors.whiteColor,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 30.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24.r),
                        ),
                      ),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                AppAssets.locationIcon,
                                height: 32,
                                width: 32,
                              ),
                              widthSpace(12.w),
                              Expanded(
                                child: Text(
                                  cubit.currentLocationName ?? "",
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.textStyle12.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          heightSpace(40.h),
                          CustomButton(
                            height: 56,
                            borderRadius: BorderRadius.circular(30),
                            backgroundColor: AppColors.primary,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                              fontFamily: "Cairo",
                            ),
                            onPressed: () {
                              if (argument.addressModel != null) {
                                cubit.updateAddress(
                                  argument.addressModel!.id,
                                  context,
                                  argument.onUpdate,
                                );
                              } else {
                                cubit.addAddress(context, argument.onUpdate);
                              }
                            },
                            isLoading:
                                state is AddAddressLoading ||
                                state is UpdateAddressLoading,
                            text: "تاكيد الموقع",
                          ),
                        ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
