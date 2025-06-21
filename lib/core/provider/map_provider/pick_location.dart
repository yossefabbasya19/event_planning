import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geoCoder;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PickLocation extends ChangeNotifier {
  Location location = Location();
  CameraPosition cameraPosition = CameraPosition(
    zoom: 14,
    target: LatLng(0, 0),
  );
  Set<Marker> marker = {};
  LatLng? eventLocation;
  LocationData? currentLocation;

  GoogleMapController? googleMapController;

  Future<bool> checkPermissionStatus() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> checkServiceEnabled() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  Future<void> changeInMap(double lat, double lng) async {
    cameraPosition = CameraPosition(zoom: 14, target: LatLng(lat, lng));
    marker = {};
    marker.add(Marker(markerId: MarkerId("1"), position: LatLng(lat, lng)));
    await googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    notifyListeners();
  }
 LatLng? latLng;
  Future<void> getLocation(BuildContext context) async {
    bool permissionStatus = await checkPermissionStatus();
    if (!permissionStatus) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enable location Permission From settings")),
      );
      return;
    }
    bool serviceEnabled = await checkServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    currentLocation = await location.getLocation();
    latLng  = LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

    changeInMap(
      currentLocation?.latitude ?? 0,
      currentLocation?.longitude ?? 0,
    );

    notifyListeners();
  }

  onTapInMap(LatLng latLng) {
    eventLocation = latLng;
    changeInMap(latLng.latitude, latLng.longitude);
    notifyListeners();
  }
}
