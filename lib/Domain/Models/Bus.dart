import 'package:sbsr_grad/Data/Models/BusDto.dart';

class Bus {
  String busName;
  String from;
  String to;
  String nextStation;
  bool isFavorite = false;

  Bus(
      {required this.busName,
      required this.from,
      required this.nextStation,
      required this.to});

  BusDto toDataSource() {
    return BusDto(
        busName: busName,
        from: from,
        nextStation: nextStation,
        to: to);
  }
}
