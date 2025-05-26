import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<String> getLocationAddress(LatLng latLng) async {
  String address = '';
  List<Placemark> addresses = [];
  addresses = await placemarkFromCoordinates(
    latLng.latitude,
    latLng.longitude,
  );
  address = "${addresses.first.locality} , ${addresses.first.country}";
  return address;
}