import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMarker{
  String markerid;
  LatLng position;
  MyMarker({required this.markerid , required this.position});

  static List<Marker> getListOfMarkers(){
    List<Marker> allMarkersList = [
       const Marker(
          markerId: MarkerId("markerid"), position: LatLng(30.2502862,31.4895708)),
       const Marker(
          markerId: MarkerId("markerid"), position: LatLng(30.1365293, 31.3257901)),
       const Marker(
          markerId: MarkerId("markerid"), position: LatLng(29.9930348, 31.3087929)),
      const Marker(
          markerId: MarkerId("markerid"), position: LatLng(30.0046004,31.4534184))
    ];
    return allMarkersList;
  }
}