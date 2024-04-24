import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Model/Marker.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapNavigator.dart';

class MapViewModel extends BaseViewModel<MapNavigator> {
  var locationManager = Location();
  List<Marker> markerList = MyMarker.getListOfMarkers();
  List<Marker> filteredMarkers = [];
  var myHome = const CameraPosition(
    target: LatLng(30.0066885, 31.4531664),
    zoom: 16,
  );
  GoogleMapController? mapController;

  Future<bool> isLocationServiceEnabled() async {
    return await locationManager.serviceEnabled();
  }

  Future<bool> requestService() async {
    var enabled = await locationManager.requestService();
    return enabled;
  }

  Future<bool> isPermissionGranted() async {
    var permissionStatus = await locationManager.hasPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> requestPermission() async {
    var permissionStatus = await locationManager.requestPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> canUseGPS() async {
    var permissionGranted = await isPermissionGranted();
    if (!permissionGranted) {
      return false;
    }
    var isServiceEnabled = await isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return false;
    }
    return true;
  }

  void askUserForPermissionAndService() async {
    await requestPermission();
    await requestService();
    getUserLocation();
  }

  void getUserLocation() async {
    var canGetLocation = await canUseGPS();
    if (!canGetLocation) return;
    var locationData = await locationManager.getLocation();
  }

  StreamSubscription<LocationData>? trackingService;

  void trackUserLocation() async {
    var canGetLocation = await canUseGPS();
    if (!canGetLocation) return;
    locationManager.changeSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1000, //time between updates
        interval: 5);
    trackingService =
        locationManager.onLocationChanged.listen((locationData) {});
  }

  void drawUserMarker() async {
    var canGetLocation = await canUseGPS();
    if (!canGetLocation) return;
    var locationData = await locationManager.getLocation();
    mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(locationData.latitude!, locationData.longitude!), 18));
    for (int i = 0; i < markerList.length; i++) {
      markerList.add(Marker(
          markerId: MarkerId(filteredMarkers[i].markerId.value),
          position: LatLng(filteredMarkers[i].position.latitude,
              markerList[i].position.longitude)));
    }
    markerList = filteredMarkers;
  }

  Future<void> searchMarkers(String searchQuery) async {
    // 1. Find the searched marker
    var searchedMarker = await markerList.firstWhere((marker) =>
    marker.markerId.value.toLowerCase() == searchQuery.toLowerCase());

    // 2. Handle search results
    // Center map on the searched marker
    final cameraUpdate = CameraUpdate.newLatLngZoom(searchedMarker.position, 16);
    mapController?.animateCamera(cameraUpdate);
    notifyListeners();
  }

}
