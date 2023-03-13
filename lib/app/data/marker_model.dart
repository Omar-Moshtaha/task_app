import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMarker {
  Set<Marker> marker = {};
  String? country;
  String? street;

  MyMarker(this.marker, this.country, this.street);
}
