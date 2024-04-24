import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';

class Bus {
  String uid;
  String busName;
  String from;
  String to;
  String nextStation;
  bool isFavorite = false;
  int favoriteIndex = 0;

  Bus({required this.uid,
    required this.busName,
    required this.from,
    required this.nextStation,
    required this.to});

  BusDto toDataSource() {
    return BusDto(
      uid: uid,
      busName: busName,
      from: from,
      nextStation: nextStation,
      to: to,
    );
  }

  HiveBusModel toBus() {
    return HiveBusModel(
        busName: busName,
        from: from,
        to: to,
        nextStation: nextStation,
        uid: uid);
  }
}
