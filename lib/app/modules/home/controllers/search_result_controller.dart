import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/data/marker_model.dart';

class SearchResultController extends GetxController {
  bool switchValue = false;
  Set<Marker> marker = {};
  List<MyMarker> myMarker = [];
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/location_marker.png")
        .then((value) {
      markerIcon = value;
    });
    update();
  }

  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  CameraPosition googlePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void onInit() {
    addCustomIcon();
    super.onInit();
  }

  double? lat;
  double? long;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeValueOfSwitchValue() {
    switchValue = !switchValue;
    update();
  }

  String? street;
  String? country;

  Future<void> getGeocodingOfLatLng(double Lat, double Long) async {
    lat = Lat;
    long = Long;

    List<Placemark> placemarks = await placemarkFromCoordinates(Lat, Long);
    print(placemarks[0].administrativeArea);
    country = placemarks[0].country;
    street = placemarks[0].street;

    if (marker.length == 0) {
      marker.add(
        Marker(
            markerId: const MarkerId("1"),
            position: LatLng(Lat, Long),
            icon: markerIcon),
      );
      myMarker.add(MyMarker(marker, country, street));
      update();
    } else {
      Marker myMark = marker.firstWhere(
          (marker) => marker.markerId.value == "1",
          orElse: () => null!);

      marker.remove(myMark);
      update();
    }

    update();
  }

  void deleteMarker() {
    marker = {};
    update();
  }
}
