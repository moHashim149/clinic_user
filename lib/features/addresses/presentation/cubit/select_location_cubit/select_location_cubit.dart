import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/custom_location_helper.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../core/util/extensions/navigation.dart';
import '../../../../auth/data/repository/auth_repository.dart';
import '../../../data/arguments/select_address_argument.dart';
import '../../../data/params/add_address_param.dart';
import '../../../data/params/delete_address_param.dart';
import '../../../data/params/edit_address_param.dart';
import '../../../data/repository/addresses_repository.dart';

part 'select_location_state.dart';

@injectable
class SelectLocationCubit extends Cubit<SelectLocationState> {
  final AuthRepository repository;
  final AddressesRepository addressesRepository;
  SelectLocationCubit(this.repository, this.addressesRepository)
    : super(SelectLocationInitial());
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  GoogleMapController? googleMapController;

  LatLng? currentLocation;

  BitmapDescriptor? markerIcon;

  LatLng defaultLocation = const LatLng(21.437273, 40.512714);

  void updateLocationOnTap({required LatLng newLocation}) async {
    currentLocation = newLocation;
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 13),
      ),
    );
    emit(UpdateCameraLocation());
  }

  void loadMarkerIcon() async {
    markerIcon ??= await BitmapDescriptor.asset(
      const ImageConfiguration(),
      AppAssets.marker,
      height: 34.h,
      width: 32.w,
    );
  }

  void onMapCreate(GoogleMapController controller) async {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
      googleMapController = await mapController.future;
      emit(OnMapCreateSuccess());
    }
  }

  String? currentLocationName;

  void checkCurrentLocation({required SelectAddressArgument argument}) {
    emit(GetCurrentLoading());
    if (argument.addressModel == null) {
      checkPermission();
    } else {
      currentLocation = LatLng(
        double.parse(argument.addressModel!.lat),
        double.parse(argument.addressModel!.lng),
      );
      currentLocationName = argument.addressModel!.location;
      nameCtrl.text = argument.addressModel!.name;
    }

    loadMarkerIcon();
  }

  void checkPermission() async {
    emit(GetCurrentLoading());
    await Geolocator.requestPermission();
    bool serviceEnabled = await LocationHelper.isServiceEnabled();
    bool serviceHavePermission = await LocationHelper.isServiceHavePermission();
    if (serviceEnabled && serviceHavePermission) {
      return getCurrentLocation(isApple: false);
    } else if (!serviceEnabled && serviceHavePermission) {
      return getCurrentLocation(isApple: false);
    } else if (serviceEnabled && !serviceHavePermission) {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return getCurrentLocation(isApple: false);
          } else {
            return getCurrentLocation(isApple: true);
          }
        },
      );
    } else {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return getCurrentLocation(isApple: false);
          } else {
            return getCurrentLocation(isApple: true);
          }
        },
      );
    }
  }

  void getCurrentLocation({required bool isApple}) async {
    try {
      if (isApple) {
        currentLocation = defaultLocation;
      } else {
        Position? position = await LocationHelper.getCurrentPosition();
        if (position != null) {
          currentLocation = LatLng(position.latitude, position.longitude);
        }
      }
      googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation!, zoom: 15),
        ),
      );
      Placemark placeMark = await LocationHelper.getLocationInfo(
        currentLocation!,
      );
      currentLocationName =
          "${placeMark.name}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}";
      emit(GetCurrentSuccess());
    } catch (error) {
      emit(GetCurrentFailure(error: error.toString()));
    }
  }

  void checkPermissionAndUpdateCurrentLocation() async {
    await Geolocator.requestPermission();
    bool serviceEnabled = await LocationHelper.isServiceEnabled();
    bool serviceHavePermission = await LocationHelper.isServiceHavePermission();
    if (serviceEnabled && serviceHavePermission) {
      updateCurrentLocation();
    } else if (!serviceEnabled && serviceHavePermission) {
      updateCurrentLocation();
    } else if (serviceEnabled && !serviceHavePermission) {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return updateCurrentLocation();
          }
        },
      );
    } else {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return updateCurrentLocation();
          }
        },
      );
    }
  }

  void updateCurrentLocation() async {
    Position? position = await LocationHelper.getCurrentPosition();
    if (position != null) {
      LatLng currentLoc = LatLng(position.latitude, position.longitude);
      currentLocation = currentLoc;
      googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLoc, zoom: 15),
        ),
      );
    }
  }

  void updateCameraPos({required LatLng pos}) async {
    currentLocation = pos;
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 15),
      ),
    );
  }

  void onUpdateCamera({required CameraPosition position}) {
    currentLocation = position.target;
  }

  TextEditingController nameCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addAddress(BuildContext context, VoidCallback onUpdate) async {
    if (!formKey.currentState!.validate()) return;
    emit(AddAddressLoading());
    var result = await addressesRepository.addAddress(
      AddAddressParam(
        location: currentLocationName ?? "",
        name: nameCtrl.text,
        lat: currentLocation!.latitude,
        lng: currentLocation!.longitude,
      ),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(AddAddressFailure());
      },
      (message) {
        context.pop();
        onUpdate();
        emit(AddAddressLoaded());
      },
    );
  }

  Future<void> deleteAddress(
    BuildContext context,
    int addressId,
    VoidCallback onUpdate,
  ) async {
    emit(DeleteAddressLoading());
    var result = await addressesRepository.deleteAddress(
      DeleteAddressParam(id: addressId),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(DeleteAddressFailure());
      },
      (message) {
        context.pop();
        context.pop();
        onUpdate();
        emit(DeleteAddressLoaded());
      },
    );
  }

  Future<void> updateAddress(
    int addressId,
    BuildContext context,
    VoidCallback onUpdate,
  ) async {
    if (!formKey.currentState!.validate()) return;
    emit(UpdateAddressLoading());
    final result = await addressesRepository.editAddress(
      EditAddressParam(
        id: addressId,
        location: currentLocationName ?? "",
        name: nameCtrl.text,
        lat: currentLocation!.latitude,
        lng: currentLocation!.longitude,
      ),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(UpdateAddressFailure());
      },
      (message) {
        context.pop();
        onUpdate();
        emit(UpdateAddressLoaded());
      },
    );
  }

  @override
  Future<void> close() {
    if (googleMapController != null) {
      googleMapController!.dispose();
    }

    nameCtrl.dispose();

    return super.close();
  }
}
