import 'package:sbsr_grad/Domain/Models/Station.dart';

class StationDTO {
  String stationID;
  String stationName;

  StationDTO({required this.stationID, required this.stationName});

  StationDTO.fromFireStore(Map<String, dynamic> json)
      : this(
          stationID: json["stationID"],
          stationName: json["stationName"],
        );

  Map<String, dynamic> toFireStore() {
    return {
      "stationName": stationName,
      "stationID": stationID,
    };
  }

  Station toDomain() {
    return Station(stationID: stationID, stationName: stationName);
  }
}
