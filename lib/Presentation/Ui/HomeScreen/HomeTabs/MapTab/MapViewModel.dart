import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sbsr_grad/Core/Base/BaseViewModel.dart';
import 'package:sbsr_grad/Presentation/Model/Marker.dart';
import 'package:sbsr_grad/Presentation/Ui/HomeScreen/HomeTabs/MapTab/MapNavigator.dart';

class MapViewModel extends BaseViewModel<MapNavigator> {
  var locationManager = Location();
  static const String obour = "obour";
  static const String ainShams = "Ain-Shams";
  static const String mtiMarker = 'mti';
  static const String tagmoaa = 'tagmoaa';
  List<Marker> markerList = MyMarker.getListOfMarkers();
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
    // for(int i =0; i<markerList.length; i++){
    //       markerList.add(Marker(
    //       markerId: MarkerId(markerList[i].markerId.value),
    //       position: LatLng(markerList[i].position.latitude, markerList[i].position.longitude)));
    // }
    const Marker(
        markerId: MarkerId(obour), position: LatLng(30.2502862,31.4895708));
    const Marker(
    markerId: MarkerId(mtiMarker), position: LatLng(30.1365293, 31.3257901));
    const Marker(
    markerId: MarkerId(ainShams), position: LatLng(29.9930348, 31.3087929));
    const Marker(
    markerId: MarkerId(tagmoaa), position: LatLng(30.0046004,31.4534184));
    notifyListeners();
  }


}
