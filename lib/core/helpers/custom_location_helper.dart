import 'dart:async';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../brandy_app.dart';


class LocationHelper {


  static Future<bool> checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return false;
    }

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return true;
    }

    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return true;
    }

    return false;
  }

  /// Gets the current location if permission is granted.
  static Future<Position?> getCurrentLocation() async {
    bool hasPermission = await checkAndRequestPermission();

    if (!hasPermission) {
      return null; // Handle denied permission gracefully
    }

    return await Geolocator.getCurrentPosition();
  }

    static Future<void> openAppIfPermissionDenied
    ({Function()? onFinish}) async {
      final isGranted = await Permission.locationWhenInUse
          .request()
          .isGranted;
      if (!isGranted) {
        await AppSettings.openAppSettings(type: AppSettingsType.settings);
        final context = BrandyApp.appNavigatorKey.currentState!.context;
        if (context.mounted) {
          Navigator.pop(context);
        }
        onFinish!();
      }
    }

    static Future<Placemark> getLocationInfo(LatLng position) async =>
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((value) {
      Placemark placeMark = value[0];
      return placeMark;
    });

    static LatLngBounds bounds(Set<Marker> markers) {
      return createBounds(markers.map((m) => m.position).toList());
    }

    static LatLngBounds createBounds(List<LatLng> positions) {
      final southwestLat = positions.map((p) => p.latitude).reduce(
              (value, element) =>
          value < element
              ? value
              : element); // smallest
      final southwestLon = positions
          .map((p) => p.longitude)
          .reduce((value, element) => value < element ? value : element);
      final northeastLat = positions.map((p) => p.latitude).reduce(
              (value, element) => value > element ? value : element); // biggest
      final northeastLon = positions
          .map((p) => p.longitude)
          .reduce((value, element) => value > element ? value : element);
      return LatLngBounds(
          southwest: LatLng(southwestLat, southwestLon),
          northeast: LatLng(northeastLat, northeastLon));
    }

    static double calculateDistance(LatLng position1, LatLng position2) {
      var lat1 = position1.latitude;
      var lon1 = position1.longitude;
      var lat2 = position2.latitude;
      var lon2 = position2.longitude;
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      return (12742 * asin(sqrt(a))).roundToDouble();
    }



// static Future<LocationDM?> getNearestAddressLocation(
//     List<LocationDM> locations, Position current) async {
//   List<LocationWithDistance> myLocations = [];
//   for (var item in locations) {
//     myLocations.add(LocationWithDistance(item, 0.0));
//   }
//   LocationDM? userLocation;
//   var currentLocation = LatLng(current.latitude, current.longitude);
//   for (var element in myLocations) {
//     var distance = calculateDistance(
//         LatLng(double.parse(element.location.lat),
//             double.parse(element.location.long)),
//         currentLocation);
//     element.distance = distance;
//   }
//   var my = myLocations
//     ..sort((a, b) {
//       return a.distance.compareTo(b.distance);
//     });
//   if (my.isNotEmpty) {
//     if (my.first.distance < 1) {
//       userLocation = my.first.location;
//       return userLocation;
//     }
//   }
//   print(my.first.distance.toString());
//   print(my.first.location.area.toString());
//   return userLocation;
// }
  }

// class LocationWithDistance {
//   final LocationDM location;
//   double distance;
//
//   LocationWithDistance(this.location, this.distance);
// }
