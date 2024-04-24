import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMarker{
  String markerid;
  LatLng position;
  static const String obour = "obour";
  static const String ain = "ain";
  static const String mti = 'mti';
  static const String tagmoaa = 'tagmoaa';
  MyMarker({required this.markerid , required this.position});

  static List<Marker> getListOfMarkers(){
    List<Marker> allMarkersList = [
       const Marker(
          markerId: MarkerId(obour), position: LatLng(30.2502862,31.4895708)),
       const Marker(
          markerId: MarkerId(ain), position: LatLng(30.1365293, 31.3257901)),
       const Marker(
          markerId: MarkerId(mti), position: LatLng(29.9930348, 31.3087929)),
      const Marker(
          markerId: MarkerId(tagmoaa), position: LatLng(30.0046004,31.4534184))
    ];
    return allMarkersList;
  }
}