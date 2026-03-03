import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class ClinicLocationMapArguments {
  final double latitude;
  final double longitude;
  final String clinicName;
  final String address;

  ClinicLocationMapArguments({
    required this.latitude,
    required this.longitude,
    required this.clinicName,
    required this.address,
  });
}

class ClinicLocationMapView extends StatefulWidget {
  final ClinicLocationMapArguments arguments;

  const ClinicLocationMapView({super.key, required this.arguments});

  @override
  State<ClinicLocationMapView> createState() => _ClinicLocationMapViewState();
}

class _ClinicLocationMapViewState extends State<ClinicLocationMapView> {
  late GoogleMapController mapController;
  late Marker clinicMarker;

  @override
  void initState() {
    super.initState();
    clinicMarker = Marker(
      markerId: MarkerId(widget.arguments.clinicName),
      position: LatLng(widget.arguments.latitude, widget.arguments.longitude),
      infoWindow: InfoWindow(
        title: widget.arguments.clinicName,
        snippet: widget.arguments.address,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.arguments.latitude,
                widget.arguments.longitude,
              ),
              zoom: 15.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: {clinicMarker},
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
          ),

          // Back Button
          Positioned(
            top: 50.h,
            right: 24.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.blackColor,
                  size: 24.r,
                ),
              ),
            ),
          ),

          // Bottom Info Sheet
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.arguments.clinicName,
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  heightSpace(12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primaryColor,
                        size: 20.r,
                      ),
                      widthSpace(8.w),
                      Expanded(
                        child: Text(
                          widget.arguments.address,
                          style: AppTextStyles.textStyle14.copyWith(
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  heightSpace(24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
