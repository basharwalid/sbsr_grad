import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapNavigator.dart';

class MapViewModel extends BaseViewModel<MapNavigator> {
  var locationManager = Location();
  var myHome = const CameraPosition(target: LatLng(30.0300824,31.4548911),
    zoom: 16,
    tilt: 90
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

  void getUserLocation()async{
    var canGetLocation = await canUseGPS();
    if(!canGetLocation)return;
    var locationData = await locationManager.getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }

  StreamSubscription<LocationData>? trackingService;
  void trackUserLocation() async {
    var canGetLocation = await canUseGPS();
    if (!canGetLocation) return;
    locationManager.changeSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1000, //time between updates
      interval: 5
    );
    trackingService = locationManager.onLocationChanged.listen((locationData) {
    });
  }
  @override
  void dispose() {
    trackingService?.cancel();
    super.dispose();
  }
}
