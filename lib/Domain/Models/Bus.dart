import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';

class Bus {
  String busName;
  String from;
  String to;
  String nextStation;
  bool isFavorite = false;
  int favoriteIndex = 0;
  Bus(
      {required this.busName,
      required this.from,
      required this.nextStation,
      required this.to});

  BusDto toDataSource() {
    return BusDto(
        busName: busName, from: from, nextStation: nextStation, to: to);
  }

  HiveBusModelDTO toBus() {
    return HiveBusModelDTO(
        busName: busName,
        from: from,
        to: to,
        nextStation: nextStation,
    );
  }
}
