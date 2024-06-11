import 'package:sbsr_grad/Data/Models/StationDTO.dart';

class Station {
  String stationID;
  String stationName;

  Station({required this.stationID, required this.stationName});

  StationDTO todataSource() {
    return StationDTO(stationID: stationID, stationName: stationName);
  }
}
